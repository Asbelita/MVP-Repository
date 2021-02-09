import Foundation

extension Data {
    var hexString: String {
        return self.reduce("", { $0 + String(format: "%02x", $1) })
    }
}

extension String {
    var hexData: Data {
        var data = Data(capacity: self.count / 2)
        
        let regex = try! NSRegularExpression(pattern: "[0-9a-f]{1,2}", options: .caseInsensitive)
        regex.enumerateMatches(in: self, range: NSRange(startIndex..., in: self)) { match, _, _ in
            let byteString = (self as NSString).substring(with: match!.range)
            let num = UInt8(byteString, radix: 16)!
            data.append(num)
        }
        
        guard data.count > 0 else { return Data() }
        
        return data
    }
}

class DataCrypterService: NSObject {
    
    var aesCode: AES256Crypter?
    static let sharedInstance = DataCrypterService()
    
    override init() {
        super.init()
        getAesCode()
    }
    
    private func getAesCode() {
        if aesCode == nil {
            generateCode()
        }
    }
    
    private func generateCode() {
        do {
            let password = "password"
            let salt = AES256Crypter.randomSalt()
            let iv = AES256Crypter.randomIv()
            let key = try AES256Crypter.createKey(password: password.data(using: .utf8)!, salt: salt)
            let aes = try AES256Crypter(key: key, iv: iv)
            aesCode = aes
        } catch {
            print("Failed")
            print(error)
        }
    }
    
    func crypter(string: String)-> String{
        do {
            let sourceData = string.data(using: .utf8)!
            let encryptedData = try aesCode!.encrypt(sourceData)
            print(encryptedData)
            
            let decryptedData = try aesCode!.decrypt(encryptedData)
            print("Encrypted hex string: \(encryptedData.hexString)")
            print("Decrypted hex string: \(decryptedData.hexString)")
            
            return encryptedData.hexString
        } catch {
            print("Failed")
            print(error)
            return Constants.empty
        }
    }
    
    func decrypter(string: String)-> String{
        do {
            let sourceData = string.hexData
            let decryptedData = try aesCode!.decrypt(sourceData)
            return decryptedData.hexString
        } catch {
            print("Failed")
            print(error)
            return Constants.empty
        }
    }
}
