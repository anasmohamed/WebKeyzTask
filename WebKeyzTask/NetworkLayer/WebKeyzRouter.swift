//
//  WebKeyzRouter.swift
//  WebKeysTask
//
//  Created by Anas on 1/24/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import Foundation
import Alamofire

enum WebKeyzTask: URLRequestConvertible {
    
    
    case getHotels
    
    
    var path: String {
        switch self {
        case .getHotels:
            return NetworkingConstants.getHotels
            
        }
    }
    
    var httpMethod: HTTPMethod {
        
        switch self {
        case .getHotels:
            
            return .get
        
            
        }
    }
    //
    //    var httpHeaders: HTTPHeaders{
    //
    //        var httpHeaders = HTTPHeaders()
    //
    //        switch self {
    //        case .booking,.updateUser,.userOffersReservations:
    //            let token = UserDefaults.standard.string(forKey: "token")
    //            print("token \(token)")
    //            httpHeaders.add(name: "Authorization", value: "Bearer \(token!)")
    //            httpHeaders.add(name: "Content-Type", value:"application/X-Access-Token")
    //        //            httpHeaders[NetworkingConstants.contentType] = NetworkingConstants.contentTypeJSON
    //        default:
    //            print("Empty request headers")
    //        }
    //
    //        return httpHeaders
    //    }
    //
    //    var body: [String: Any] {
    //
    //        var body = [String:Any]()
    //
    //        switch self {
    //        case let .register(email, password, name, phonenumber, genderId, birthday):
    //            body[NetworkingConstants.registerEmailParamter] = email
    //            body[NetworkingConstants.registerPasswordParamter] = password
    //            body[NetworkingConstants.registerNameParamter] = name
    //            body[NetworkingConstants.registerPhoneNumberParamter] = phonenumber
    //            body[NetworkingConstants.registerGenderIdParamter] = genderId
    //            body[NetworkingConstants.registerBirthdayParamter] = birthday
    //        case let .getUserToken(grantType, clientId, clientSecret, scope):
    //            body[NetworkingConstants.getUserTokenGrantTypeParamter] = grantType
    //            body[NetworkingConstants.getUserTokenClientIdParamter] = clientId
    //            body[NetworkingConstants.getUserTokenClientSecretParamter] = clientSecret
    //            body[NetworkingConstants.getUserTokenScopeParamter] = scope
    //
    //        case let .updateUser(email, name, phoneNumber, genderId, birthday):
    //            body[NetworkingConstants.updateUserProfileEmailParameter] = email
    //            body[NetworkingConstants.updateUserProfileNameParameter] = name
    //            body[NetworkingConstants.updateUserProfilePhoneNumberParameter] = phoneNumber
    //            body[NetworkingConstants.updateUserProfileGenderIdParameter] = genderId
    //            body[NetworkingConstants.updateUserProfileBirthdayParameter] = birthday
    //        case let .loginWithSocial(accessTocken, provider):
    //            body[NetworkingConstants.loginWithSocialAccessTockenParamter] = accessTocken
    //            body[NetworkingConstants.loginWithSocialProviderParamter] = provider
    //        case let .login(email, password):
    //            body[NetworkingConstants.emailParameter] = email
    //            body[NetworkingConstants.passwordParameter] = password
    //        case let .resetPassword(email,userType,token,password,passwordConfirmation):
    //
    //            body[NetworkingConstants.emailResetPasswordParamter] = email
    //            body[NetworkingConstants.userTypeResetPasswordParamter] = userType
    //            body[NetworkingConstants.tokenResetPasswordParamter] = token
    //            body[NetworkingConstants.passwordResetPasswordParamter] = password
    //            body[NetworkingConstants.passwordConfirmationResetPasswordParamter] = passwordConfirmation
    //        case let .sendMessage(phonenumber, userType):
    //            body[NetworkingConstants.sendMessagePhoneNumberPrameter] = phonenumber
    //            body[NetworkingConstants.sendMessageUserTypePrameter] = userType
    //        case let .verifyUser(phonenumber, userType, code):
    //            body[NetworkingConstants.verifyUserPhoneNumberPrameter] = phonenumber
    //            body[NetworkingConstants.verifyUserUserTypePrameter] = userType
    //            body[NetworkingConstants.verifyUserCodePrameter] = code
    //
    //        default:
    //            print("Empty request body")
    //        }
    //
    //        return body
    //    }
    //
    //    var params: [String: Any] {
    //
    //        var params = [String:Any]()
    //
    //        switch self {
    //        case let .searchByName(name):
    //            params[NetworkingConstants.searchByNameParameter] = name
    //        case let .searchBySpecialty(specialty):
    //            params[NetworkingConstants.searchBySpecialtyParameter] = specialty
    //        case let .searchByLabName(name):
    //            params[NetworkingConstants.searchByLabNameParameter] = name
    //        case let .searchForLabByAreaId(areaId):
    //            params[NetworkingConstants.searchForLabByAreaIdParameter] = areaId
    //        case let .showLabDetails(id):
    //            params[NetworkingConstants.showLabDetails] = id
    //        case let .showDoctorDetails(id):
    //            params[NetworkingConstants.showDoctorDetails] = id
    //        case let .getOffresForSpacificCategory(id):
    //            params[NetworkingConstants.getOffersForSpacificCategory] = id
    //        case let .showDoctorDates(id):
    //            params[NetworkingConstants.showDoctorDates] = id
    //        case let .showPharmacyDetails(id):
    //            params[NetworkingConstants.showPharmacyDetails] = id
    //        case let .showOfferDetails(id):
    //            params[NetworkingConstants.showOfferDetails] = id
    //        case let .offersForSpecificCategory(id):
    //            params[NetworkingConstants.offersForSpecificCategory] = id
    //        case let .doctorReservation(name, email, phonenumber, bookingDate, doctorId, checkbox):
    //            params[NetworkingConstants.reservationNameParameter] = name
    //            params[NetworkingConstants.reservationEmailParameter] = email
    //            params[NetworkingConstants.reservationPhonenumberParameter] = phonenumber
    //            params[NetworkingConstants.reservationBookingDateParameter] = bookingDate
    //            params[NetworkingConstants.reservationDoctorIdParameter] = doctorId
    //            params[NetworkingConstants.reservationCheckboxParameter] = checkbox
    //        case let .labReservation(name, email, phonenumber, bookingDate, labId, checkbox):
    //            params[NetworkingConstants.reservationNameParameter] = name
    //            params[NetworkingConstants.reservationEmailParameter] = email
    //            params[NetworkingConstants.reservationPhonenumberParameter] = phonenumber
    //            params[NetworkingConstants.reservationBookingDateParameter] = bookingDate
    //            params[NetworkingConstants.reservationDoctorIdParameter] = labId
    //            params[NetworkingConstants.reservationCheckboxParameter] = checkbox
    //        case let .cancelBooking(id):
    //            params[NetworkingConstants.cancelBooking] = id
    //        case let .showOffer(id):
    //            params[NetworkingConstants.cancelBooking] = id
    //        case let .searchByAreaAndSpecialty(areaid,specialtyId):
    //            params[NetworkingConstants.searchByAreaAndSpecialtyAreaIdParamter] = areaid
    //            params[NetworkingConstants.searchByAreaAndSepecialtyIdParamter] = specialtyId
    //
    //
    //            //        case let .getUserToken(grantType,clientId,clientSecret,scope):
    //            //            params[NetworkingConstants.getUserTokenGrantTypeParamter] = grantType
    //            //            params[NetworkingConstants.getUserTokenClientIdParamter] = clientId
    //            //            params[NetworkingConstants.getUserTokenClientSecretParamter] = clientSecret
    //            //            params[NetworkingConstants.getUserTokenScopeParamter] = scope
    //
    //
    //        default:
    //            print("Empty Paramter")
    //
    //        }
    //
    //        return params
    //    }
    //
    func asURLRequest() throws -> URLRequest {
        let baseURL = try NetworkingConstants.baseURL.asURL()
        
        // URL Request Components
        var urlRequest = URLRequest(url: baseURL.appendingPathComponent(path))
        urlRequest.httpMethod = httpMethod.rawValue
        switch self {
        case .getHotels:
            
            
            return try URLEncoding.default.encode(urlRequest, with: nil)
            
        }
    }
}
