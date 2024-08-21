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
    
    func getData() async -> [Team] {
        //
        
        if apiKey != nil {
            
            //URL
            
            if let url = URL(string: "https://api.football-data.org/v4/teams"){
                
                //URL Request
                var request = URLRequest(url: url)
                request.addValue(apiKey!, forHTTPHeaderField: "X-Auth-Token")
//                print(request)

                
                
                
                //URLSession
                
                do {
                    let (data, response) = try await URLSession.shared.data(for: request)
//                    print("DAta: \(data)")
                    
                    if let httpResponse = response as? HTTPURLResponse{
                        print(httpResponse.statusCode)
                        
                        if httpResponse.statusCode == 200 {
                            
                            // parse the data
                            let decoder = JSONDecoder()
                            let results = try decoder.decode(FootballResponse.self, from: data)
//                            print("Here are the results")
                            return (results.teams)
                        } else {
                            print("Status code: \(httpResponse.statusCode)")
                        }
                    } else {
                        print("Could not generate httpResponse as url response.")
                    }
                    
                    
                    
                } catch {
                    print("Error occurred: \(error.localizedDescription)")
                }
                
            }
        } else {
            print("This api key isn't working.")
        }
        
        return []
    }
}
