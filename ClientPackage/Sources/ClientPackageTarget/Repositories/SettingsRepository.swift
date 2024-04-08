import UIKit
import OSLogs

class SettingRepository {
    @UserDefaultCodable(key: .favorited, defaultValue: [])
    var favorited: Set<UUID>

    enum Keys: String {
        case favorited
    }

    @propertyWrapper
    struct UserDefaultArchived<DecodedObjectType> where DecodedObjectType: NSObject, DecodedObjectType: NSCoding {
        let key: Keys
        let defaultValue: DecodedObjectType

        var wrappedValue: DecodedObjectType {
            get {
                Logs.repo.log("Accessing key: \(self.key.rawValue)")
                do {
                    guard
                        let data = UserDefaults.standard.data(forKey: key.rawValue),
                        let value = try NSKeyedUnarchiver.unarchivedObject(
                            ofClass: DecodedObjectType.self,
                            from: data
                        )
                    else {
                        return defaultValue
                    }
                    return value
                } catch {
                    Logs.repo.error("Failed to unarchive the object with error: \(error)")
                    return defaultValue
                }
            }
            set {
                Logs.repo.log("Updating key: \(self.key.rawValue)")
                do {
                    let data = try NSKeyedArchiver.archivedData(
                        withRootObject: newValue,
                        requiringSecureCoding: false
                    )
                    UserDefaults.standard.set(data, forKey: key.rawValue)
                } catch {
                    preconditionFailure("Failed to archive the object: \(newValue), error: \(error)")
                }
            }
        }
    }

    @propertyWrapper
    struct UserDefaultBool {
        let key: Keys
        let defaultValue: Bool

        var wrappedValue: Bool {
            get {
                Logs.repo.log("Accessing key: \(self.key.rawValue)")
                if UserDefaults.standard.object(forKey: key.rawValue) == nil {
                    return defaultValue
                }
                return UserDefaults.standard.bool(forKey: key.rawValue)
            }
            set {
                Logs.repo.log("Updating key: \(self.key.rawValue)")
                UserDefaults.standard.set(newValue, forKey: key.rawValue)
            }
        }
    }

    @propertyWrapper
    struct UserDefaultCodable<T: Codable> {
        let key: Keys
        let defaultValue: T

        var wrappedValue: T {
            get {
                Logs.repo.log("Accessing key: \(self.key.rawValue)")
                guard let data = UserDefaults.standard.data(forKey: key.rawValue),
                      let type = try? JSONDecoder().decode(T.self, from: data)
                else {
                    return defaultValue
                }
                return type
            }
            set {
                Logs.repo.log("Updating key: \(self.key.rawValue)")
                if let data = try? JSONEncoder().encode(newValue) {
                    UserDefaults.standard.setValue(data, forKey: key.rawValue)
                }
            }
        }
    }
}

