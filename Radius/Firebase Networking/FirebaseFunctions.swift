//
//  FirebaseFunctions.swift
//  Radius
//
//  Created by Kassandra Capretta on 11/23/19.
//  Copyright © 2019 Kassandra Capretta. All rights reserved.
//

import Foundation
import Firebase


// MARK:- SLICE ONE
protocol FirebaseFunctionsProtocol {
    
    // SIGN UP
    func signUp(firstName: String, lastName: String, email: String, password: String, completion: @escaping (LocalUser?, Error?) -> Void)
    
    // SIGN IN
    func signIn(email: String, password: String, completion: @escaping (LocalUser?, Error?) -> Void)
    
    func updateUserInfo(user: [String: Any])
    
    // PROFILE PICTURE
    func uploadProfilePicture(pictureUrl: String)
    
    // LIKE SOMEONE
    func likeSomeone(userId: String)
    
    // ACCEPT MATCH
    func acceptMatch(userId: String)
    
    // LISTED MATCHES
    func listMatches()
    
    // CURRENT LOCATION
    func updateLocation(long: Double, lat: Double)
    
    // PEOPLE NEAR
    func listNearbyPeople()
    
    // GENDER
    func setGender(gender: String, completion: @escaping (Error?) -> Void)
    
    // FAMILY PLANS
    func setFamilyPlans(familyPlans: String, completion: @escaping (Error?) -> Void)
    
    // KIDS
    func setKids(kids: String, completion: @escaping (Error?) -> Void)
    
    // ETHNICITY
    func setEthnicity(ethnicity: String, completion: @escaping (Error?) -> Void)
    
    // LOOKING FOR
    func setLookingFor(lookingFor: String, completion: @escaping (Error?) -> Void)
    
    // INTERESTED IN
    func setInterestedIn(interestedIn: String, completion: @escaping (Error?) -> Void)
    
    // RELIGION
    func setReligion(religion: String, completion: @escaping (Error?) -> Void)
    
    // EDUCATION LEVEL
    func setEducationLevel(educationLevel: String, completion: @escaping (Error?) -> Void)
    
    // POLITICS
    func setPolitics(politics: String, completion: @escaping (Error?) -> Void)
    
    // HEIGHT
    func setHeight(height: String, completion: @escaping (Error?) -> Void)
    
    // HOMETOWN
    func setHometown(homeTown: String, completion: @escaping (Error?) -> Void)
    
    // BIRTHDAY
    func setBirthday(birthday: String, completion: @escaping (Error?) -> Void)
    
    // JOB TITLE
    func setJobTitle(jobTitle: String, completion: @escaping (Error?) -> Void)
    
    // SCHOOL
    func setSchool(school: String, completion: @escaping (Error?) -> Void)
    
    // LIFEGOAL
    func setLifeGoal(lifeGoal: String, completion: @escaping (Error?) -> Void)
    
    // TEACHME
    func setTeachMe(teachMe: String, completion: @escaping (Error?) -> Void)
    
    // CHANGEMIND
    func setChangeMind(changeMind: String, completion: @escaping (Error?) -> Void)
    
    // DRINKING
    func setDrinking(drinking: String, completion: @escaping (Error?) -> Void)
    
    
    // MARK:- SLICE TWO
    // Functions to Save Data
    
    // HomeTown, Birthday, Gender, Job Title, Religion
    func savePersonalDetailsOne(_ hometown: UserInfo<String>, _ birthday: UserInfo<String>, _ gender: UserInfo<Gender>, _ jobtitle: UserInfo<String>, _ religion: UserInfo<Religion>, completion: @escaping (Error?) -> Void)
    
    // School, Education, Politics, Drink, Height
    func savePersonalDetailsTwo(_ school: UserInfo<String>, _ education: UserInfo<EducationLevel>, _ politics: UserInfo<Politics>, _ drink: UserInfo<Drink>, _ height: UserInfo<String>, completion: @escaping (Error?) -> Void)
    
    // Questions Input (Life Goal, Change Mind, Teach Me)
    func savePersonalDetailsQuestions(_ lifeGoal: UserInfo<String>, _ changeMind: UserInfo<String>, _ teachMe: UserInfo<String>, completion: @escaping (Error?) -> Void)
    
    // The following are not currently being used:
    // _ takePride: UserInfo<String>, _ imLookingFor: UserInfo<String>, _ toKnow: UserInfo<String>,
    
    // Family Plans, Kids, Ethnicity, Looking For
    func savePersonalDetailsThree(_ family: UserInfo<FamilyPlans>, _ kids: UserInfo<Bool>, _ ethnicity: UserInfo<Ethnicity>, _ lookingFor: UserInfo<LookingFor>, completion: @escaping (Error?) -> Void)
    
    // Interested In: Dating / Networking / Friendship
    func saveInterestedIn(interestedIn: UserInfo<[InterestedIn]>,  completion: @escaping (Error?) -> Void)
    
    // Account Pictures Functions (1-6)
    func saveAccountPictures(_ accountPicture1: UserInfo<String>, _ accountPicture2: UserInfo<String>, _ accountPicture3: UserInfo<String>, _ accountPicture4: UserInfo<String>, _ accountPicture5: UserInfo<String>, _ accountPicture6: UserInfo<String>, completion: @escaping (Error?) -> Void)
    
    // Hidden / Visible
    func setVisibility(visible: Bool, item: VisibleItem, completion: @escaping(Error?) -> Void)
}

// MARK:- SLICE THREE
// Visibility Continued
class FirebaseFunctions: FirebaseFunctionsProtocol {
    func setVisibility(visible: Bool, item: VisibleItem, completion: @escaping (Error?) -> Void) {
        let usersRef = db.child("users")
        
        if let uid = Auth.auth().currentUser?.uid {
            usersRef.child("\(uid)/\(item.description)/visible").setValue(visible) { (error, dbref) in
                completion(error)
            }
        }
    }
    
    // Drinking
    func setDrinking(drinking: String, completion: @escaping (Error?) -> Void) {
        
    }
    
    // Life Goal
    func setLifeGoal(lifeGoal: String, completion: @escaping (Error?) -> Void) {
        
    }
    
    // Report Someone
    func reportSomeone(with userId: String, completion: @escaping (Error?) -> Void) {
        let usersRef = db.child("users")
        
        if let uid = Auth.auth().currentUser?.uid {
            usersRef.child("\(uid)/report/\(userId)").setValue(true) { (error, dbref) in
                completion(error)
            }
        }
    }
    
    // Set Preferences for Reporting
    func reportPreferences(with userId: String, completion: @escaping (Error?) -> Void) {
        let usersRef = db.child("users")
        
        if let uid = Auth.auth().currentUser?.uid {
            usersRef.child("\(uid)/preferences/\(userId)").setValue(true) { (error, dbref) in
                completion(error)
            }
        }
    }
    
    
    // Block Someone
    func blockSomeone(with userId: String, completion: @escaping (Error?) -> Void) {
        let usersRef = db.child("users")
        
        if let uid = Auth.auth().currentUser?.uid {
            usersRef.child("\(uid)/blocked/\(userId)").setValue(true) { (error, dbref) in
                completion(error)
            }
        }
    }
    
    // Set Preferences
    func blockPreferences(with userId: String, completion: @escaping (Error?) -> Void) {
        let usersRef = db.child("users")
        
        if let uid = Auth.auth().currentUser?.uid {
            usersRef.child("\(uid)/preferences/\(userId)").setValue(true) { (error, dbref) in
                completion(error)
            }
        }
    }
    
    // Fetching new users from Firebase
    func fetchUsers(completion: @escaping ([String: LocalUser]) -> Void) {
        let usersRef = db.child("users")
        usersRef.observeSingleEvent(of: .value) { (snapshot) in
            let value = snapshot.value as? NSDictionary ?? [:]
            var users: [String: LocalUser] = [:]
            for (id, user) in value {
                let userId = id as? String ?? ""
                if let firebaseUserDict = user as? [String: Any] {
                    var userObj = LocalUser.makeObjectFrom(firebaseUserDict)
                    userObj.userId = userId
                    users[userId] = userObj
                }
            }
            completion(users)
        }
    }
    
    
    
    func setTeachMe(teachMe: String, completion: @escaping (Error?) -> Void) {
        
    }
    
    func setChangeMind(changeMind: String, completion: @escaping (Error?) -> Void) {
        
    }
    
    // Will be used later:
    //    func setTakePride(takePride: String, completion: @escaping (Error?) -> Void) {
    //
    //    }
    
    //    func setImLookingFor(imLookingFor: String, completion: @escaping (Error?) -> Void) {
    //
    //    }
    
    //    func setToKnow(toKnow: String, completion: @escaping (Error?) -> Void) {
    //
    //    }
    
    func setFamilyPlans(familyPlans: String, completion: @escaping (Error?) -> Void) {
        
    }
    
    func setKids(kids: String, completion: @escaping (Error?) -> Void) {
        
    }
    
    func setEthnicity(ethnicity: String, completion: @escaping (Error?) -> Void) {
        
    }
    
    func setLookingFor(lookingFor: String, completion: @escaping (Error?) -> Void) {
        
    }
    
    func setInterestedIn(interestedIn: String, completion: @escaping (Error?) -> Void) {
        
    }
    
    func setReligion(religion: String, completion: @escaping (Error?) -> Void) {
        
    }
    
    func setEducationLevel(educationLevel: String, completion: @escaping (Error?) -> Void) {
        
    }
    
    func setPolitics(politics: String, completion: @escaping (Error?) -> Void) {
        
    }
    
    func setHeight(height: String, completion: @escaping (Error?) -> Void) {
        
    }
    
    func setHometown(homeTown: String, completion: @escaping (Error?) -> Void) {
        
    }
    
    func setBirthday(birthday: String, completion: @escaping (Error?) -> Void) {
        
    }
    
    func setJobTitle(jobTitle: String, completion: @escaping (Error?) -> Void) {
        
    }
    
    func setSchool(school: String, completion: @escaping (Error?) -> Void) {
        
    }
    
    func saveInterestedIn(interestedIn: UserInfo<[InterestedIn]>, completion: @escaping (Error?) -> Void) {
        
    }
    
    
    // Interested In: Dating / Networking / Friendship
    func saveInterest(interestedIn: UserInfo<[InterestedIn]>,  completion: @escaping (Error?) -> Void) {
        let usersRef = db.child("users")
        
        if let uid = Auth.auth().currentUser?.uid {
            newUser.interestedIn = interestedIn
            usersRef.child("\(uid)").setValue(newUser.makeDictionary()){(error: Error?, ref: DatabaseReference) in
                print("Error ", error, ref)
                completion(error)
            }
        }
    }
    
    // Account Pictures
    func saveAccountPictures(_ accountPicture1: UserInfo<String>, _ accountPicture2: UserInfo<String>, _ accountPicture3: UserInfo<String>, _ accountPicture4: UserInfo<String>, _ accountPicture5: UserInfo<String>, _ accountPicture6: UserInfo<String>, completion: @escaping (Error?) -> Void) {
        let usersRef = db.child("users")
        
        if let uid = Auth.auth().currentUser?.uid {
            newUser.accountPicture1 = accountPicture1
            newUser.accountPicture2 = accountPicture2
            newUser.accountPicture3 = accountPicture3
            // To be used later:
            //               newUser.accountPicture4 = accountPicture4
            //               newUser.accountPicture5 = accountPicture5
            //               newUser.accountPicture6 = accountPicture5
            
            usersRef.child("\(uid)").setValue(newUser.makeDictionary()){(error: Error?, ref: DatabaseReference) in
                print("Error ", error, ref)
                completion(error)
            }
        }
    }
    // To be used later:
    // _ takePride: UserInfo<String>, _ looking: UserInfo<String>,  _ aboutYou: UserInfo<String>
    // Life Goals, Teach Me, Change Mind, Take Pride, Looking, About You
    func savePersonalDetailsQuestions(_ lifeGoal: UserInfo<String>, _ teachMe: UserInfo<String>, _ changeMind: UserInfo<String>, completion: @escaping (Error?) -> Void) {
        let usersRef = db.child("users")
        
        if let uid = Auth.auth().currentUser?.uid {
            newUser.lifeGoal = lifeGoal
            newUser.teachMe = teachMe
            // newUser.takePride = takePride
            // newUser.imLookingFor = looking
            // newUser.toKnow = aboutYou
            newUser.changeMind = changeMind
            
            usersRef.child("\(uid)").setValue(newUser.makeDictionary()){(error: Error?, ref: DatabaseReference) in
                print("Error ", error, ref)
                completion(error)
            }
        }
    }
    
    // Family Plans, Kids, Ethnicity, Looking For men / women / both
    func savePersonalDetailsThree(_ family: UserInfo<FamilyPlans>, _ kids: UserInfo<Bool>, _ ethnicity: UserInfo<Ethnicity>, _ lookingFor: UserInfo<LookingFor>, completion: @escaping (Error?) -> Void) {
        let usersRef = db.child("users")
        // guard let key = usersRef.childByAutoId().key else { return }
        
        if let uid = Auth.auth().currentUser?.uid {
            newUser.familyPlans = family
            newUser.kids = kids
            newUser.lookingFor = lookingFor
            newUser.ethnicity = ethnicity
            
            usersRef.child("\(uid)").setValue(newUser.makeDictionary()){(error: Error?, ref: DatabaseReference) in
                print("Error ", error, ref)
                completion(error)
            }
        }
    }
    
    // School, Education Level, Politics, Drink, Height
    func savePersonalDetailsTwo(_ school: UserInfo<String>, _ education: UserInfo<EducationLevel>, _ politics: UserInfo<Politics>, _ drink: UserInfo<Drink>, _ height: UserInfo<String>, completion: @escaping (Error?) -> Void) {
        let usersRef = db.child("users")
        // guard let key = usersRef.childByAutoId().key else { return }
        
        if let uid = Auth.auth().currentUser?.uid {
            newUser.school = school
            newUser.educationLevel = education
            newUser.politics = politics
            newUser.height = height
            newUser.drink = drink
            
            usersRef.child("\(uid)").setValue(newUser.makeDictionary()){(error: Error?, ref: DatabaseReference) in
                print("Error ", error, ref)
                completion(error)
            }
        }
    }
    
    // MARK:- SLICE FOUR
    // SIGN UP functionality
    // First Name, Last Name, Email, Password
    let db = Database.database().reference()
    func signUp(firstName: String, lastName: String, email: String, password: String, completion: @escaping (LocalUser?, Error?) -> Void) {
        let usersRef = db.child("users")
        Auth.auth().createUser(withEmail: email, password: password) {[weak self] (result, error) in
            
            if let uid = result?.user.uid {
                let newUser: [String: String] = ["firstName": firstName, "lastName": lastName, "email": email]
                let newLocalUser = LocalUser(firstName: firstName, lastName: lastName, email: email)
                usersRef.child(uid).setValue(newUser){(error: Error?, ref: DatabaseReference) in
                    completion(newLocalUser, error)
                }
            } else {
                completion(nil, nil)
            }
        }
    }
    
    // SIGN IN functionality
    // Email, Password
    func signIn(email: String, password: String, completion: @escaping (LocalUser?, Error?) -> Void) {
        let usersRef = db.child("users")
        Auth.auth().signIn(withEmail: email, password: password) { [weak self]
            (result, error) in
            guard let user = result?.user else {
                completion(nil, error)
                return
            }
            
            let uid = user.uid
            
            usersRef.child(uid).observeSingleEvent(of: .value) { (snapshot) in
                let value = snapshot.value as? [String: Any]
                if let user = value {
                    let userObject = LocalUser.makeObjectFrom(user)
                    newUser = userObject
                    completion(userObject, nil)
                } else {
                    completion(nil, error)
                }
            }
        }
    }
    
    // HomeTown, Birthday, Gender, Job Title
    func savePersonalDetailsOne(_ hometown: UserInfo<String>, _ birthday: UserInfo<String>, _ gender: UserInfo<Gender>, _ jobtitle: UserInfo<String>, _ religion: UserInfo<Religion>, completion: @escaping (Error?) -> Void) {
        let usersRef = db.child("users")
        // guard let key = usersRef.childByAutoId().key else { return }
        
        if let uid = Auth.auth().currentUser?.uid {
            newUser.homeTown = hometown
            newUser.birthday = birthday
            newUser.gender = gender
            newUser.jobTitle = jobtitle
            newUser.religiousBeliefs = religion
            
            usersRef.child("\(uid)").setValue(newUser.makeDictionary()){(error: Error?, ref: DatabaseReference) in
                print("Error ", error, ref)
                completion(error)
            }
            
        }
    }
    
    // MARK:- SLICE FIVE
    func updateUserInfo(user: [String : Any]) {
        
    }
    
    func setGender(gender: String, completion: @escaping (Error?) -> Void){
        let usersRef = db.child("users")
        if let uid = Auth.auth().currentUser?.uid {
            usersRef.child("\(uid)/gender/value").setValue(gender) {(error: Error?, ref: DatabaseReference) in
                completion(error)
            }
        }
    }
    
    func uploadProfilePicture(pictureUrl: String) {
        
    }
    
    func uploadAccountPictures(pictureUrl: String) {
        
    }
    
    func likeSomeone(userId: String) {
        
    }
    
    func acceptMatch(userId: String) {
        
    }
    
    func listMatches() {
        
    }
    
    func updateLocation(long: Double, lat: Double) {
        
    }
    
    func listNearbyPeople() {
        
    }
    
    static let shared: FirebaseFunctions = FirebaseFunctions()
    
}
