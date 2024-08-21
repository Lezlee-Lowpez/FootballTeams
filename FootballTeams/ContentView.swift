//
//  ContentView.swift
//  FootballTeams
//
//  Created by Lesley Lopez on 8/15/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var teams : [Team] = []
    var dataService = DataService()
    
    
    var body: some View {
        
        VStack {
            
            Text("A List of Teams")
                .font(.title)
            .bold()
            
            
            List{
                ForEach(teams) {team in
                    Text(team.name)
                }
            }
            
            Button(action: {
                Task{
                    teams = await dataService.getData()
                }
            }, label: {
                /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
            })
        }
        
       
    }
}

#Preview {
    ContentView()
}
