import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:nilecare/auth/data/model/user_model.dart';
import 'package:nilecare/core/networks/api_client.dart';
import 'package:nilecare/core/networks/api_exceptions.dart';
import 'package:nilecare/core/networks/token_manager.dart';


class AuthRepository {
final ApiClient apiClient;
  AuthRepository(this.apiClient);
  
  Future<UserModel> login(String email, String password) async {
    try {
      final response = await apiClient.post(
        'users/login',
        body: {
          'email': email,
          'password': password,

        },
      );


        return UserModel.fromJson(response);

    }

    on ApiExceptions catch (e) {

      print(e.toString());

        rethrow;

    } catch (e) {

        throw Exception(e.toString());
    }
  
  }

  Future<bool> register(String name,String password,String phone,String email) async {


    try{

      Uri url=Uri.parse("https://nilecare.up.railway.app/api/v1/users/register");

      final response=await http.post(

                   url,
                  headers: {


                "Content-Type":"application/json",
                "accept":"application/json"
               },

               body: jsonEncode(

                  
                {
           "name": name,
          
          "password": password,
          "phone":phone,
          "email": email
          
         
  
                }
               )

              

      );

       
         
      if(response.statusCode==201 ){

        
        return true;


      }

      else{

        throw Exception(" Registration is failed,please try again later");
      }


}






    catch(e){

            throw Exception(" Regitration failed -> $e");
      
    }



  }


  Future<UserModel> refresh() async {
    try {




      TokenManager tokenInstance=TokenManager();

      String? token = await tokenInstance.getToken();
    
      final response = await apiClient.get("users/myprofile",

        headers:{

          'Authorization':'Bearer $token',
        }
        );
        UserModel user=UserModel.fromJson(response);

          return user;
      
    
    }

    on ApiExceptions catch (e) {

      print(e.toString());

        rethrow;

    } catch (e) {

        throw Exception(e.toString());
    }
  
  }


 Future<void> logout() async {
  try {
    TokenManager tokenInstance = TokenManager();
    await tokenInstance.deleteToken();

    await apiClient.post(
      "users/logout",
      headers: {},
    );
  } on ApiExceptions catch (e) {
    rethrow;
  } catch (e) {
    throw Exception(e.toString());
  }
}



  


  
}