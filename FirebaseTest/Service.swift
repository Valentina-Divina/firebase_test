//
//  Service.swift
//  FirebaseTest
//
//  Created by Valya on 16.10.2022.
//

import UIKit
import Firebase

class Service {
    
    //MARK: - регистрация
    func regNewUser(email: String, password: String, completion: @escaping (Bool)->()){
        Auth.auth().createUser(withEmail: email, password: password) { res, err in
            if err == nil {
                if let res = res {
                    // после прохождения регистрации и создания пользователя без ошибок, направим ему письмо верификации
                    res.user.sendEmailVerification()
                    self.saveUserData(uid: res.user.uid, email: email)
                    completion(true)
                }
            } else {
                let err = err as? NSError
                switch err!.code {
                case AuthErrorCode.emailAlreadyInUse.rawValue:
                    completion(false)
                default:
                    completion(true)
                }
            }
        }
    }
    //MARK: - авторизация
    func signIn(email: String, password: String, completion: @escaping (Bool)->()) {
        Auth.auth().signIn(withEmail: email, password: password) { res, err in
            if err == nil {
                if let res = res {
                    if res.user.isEmailVerified {
                        completion(true)
                    } else {
                        completion(false)
                    }
                }
            } else {
                completion(false)
            }
        }
    }
    
    //MARK: - сохранение данных
    func saveUserData(uid: String, email: String) {
        let userData: [String: Any] = ["email": email, "date": Date(), "isVerify": false]
        Firestore.firestore().collection("users")
            .document(uid)
            .setData(userData)
    }
    //MARK: - получение всех пользователей
    func getAllUsers(completion: @escaping ([String]) -> ()) {
        let uid = Auth.auth().currentUser?.uid  // здесь хранится id авторизованного пользователя
        var users = [String]()
        // получить все данные
        Firestore.firestore().collection("users").getDocuments { snap, err in
            if err == nil {
                if let docs = snap?.documents{
                    for doc in docs {
                        let email = doc["email"] as! String // Any к String
                        users.append(email)
                    }
                    completion(users)
                }
            }
        }
    }
}

// Ошибки надо обработать
