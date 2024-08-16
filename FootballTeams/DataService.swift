//
//  DataService.swift
//  FootballTeams
//
//  Created by Lesley Lopez on 8/15/24.
//

import Foundation


struct DataService {
    
    //API KEY
    var apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String
    
    func getData() async {
        //
        
        if apiKey != nil {
            
            //URL
            
            if let url = URL(string: "http://api.football-data.org/v4/teams"){
                
                //URL Request
                var request = URLRequest(url: url)
                request.addValue(apiKey!, forHTTPHeaderField: "X-Auth-Token")
                
                
                //URLSession
                
                do {
                    var (data, response) = try await URLSession.shared.data(for: request)
                    
                    if let httpResponse = response as? HTTPURLResponse{
                        print(httpResponse.statusCode)
                        
                        if httpResponse.statusCode == 200 {
                            
                            // parse the data
                            var decoder = JSONDecoder()
                            var results = try decoder.decode(FootballResponse.self, from: data)
                            print(results.teams ?? "no teams")
                        } else {
                            print("Status code: \(httpResponse.statusCode)")
                        }
                    } else {
                        print("Could not generate httpResponse as url response.")
                    }
                    
                    
                    
                } catch {
                    print("Could not return results from request.")
                }
                
            }
        } else {
            print("This api key isn't working.")
        }
        
        
    }
}
