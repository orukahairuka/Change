//
//  ContentView.swift
//  first2
//
//  Created by 櫻井絵理香 on 2024/09/01.
//

import SwiftUI

struct ContentView: View {
    @State private var degree: Double = 0.0
    private let degrees: [String] = ["摂氏","華氏","ケルビン"]
    @State var inputDegree: String = "摂氏"
    @State var outpudDegree: String = "摂氏"
    @State var resultDegree: Double = 0.0
    
    private let times: [String] = ["秒","分","時間","日"]
    @State private var time: Double = 0.0
    @State private var inputTime: String = "秒"
    @State private var outputTime: String = "秒"
    @State private var resultTime: Double = 0.0
    
    private func changeDegree (inputDegree: String, degree: Double, outputDegree: String) -> Double {
        var Degree: Double = 0.0
        switch inputDegree {
        case "摂氏":
            Degree = degree
        case "華氏":
            Degree = (degree - 32) * 5/9
        case "ケルビン":
            Degree = degree - 273.15
        default:
            return 0
        }
        
        //全部摂氏にしてあるのでそれを変換してアウトプットする
        switch outputDegree {
        case "摂氏":
            return Degree
        case "華氏":
            return Degree * 9/5 + 32
        case "ケルビン":
            return Degree + 273.15
        default:
            return 0
        }
    }
    
    private func changeTime (inputTime: String, time: Double, outputTime: String) -> Double {
        var changeTime = 0.0
        switch inputTime {
        case "秒":
            changeTime = time
        case "分":
            changeTime = time*60
        case "時間":
            changeTime = time * 3600
        case "日":
            changeTime = time * 86400
        default:
            return 0
        }
        
        switch outputTime {
        case "秒":
            return changeTime
        case "分":
            return changeTime / 60
        case "時間":
            return changeTime / 3600
        case "日":
            return changeTime / 86400
        default:
            return 0
        }
    }

    var body: some View {
        VStack {
            HStack {
                Picker("どの温度？", selection: $inputDegree) {
                    ForEach (degrees, id: \.self) { degree in
                        Text(degree)
                    }
                }
                TextField("温度入れて", value: $degree, format: .number)
                    .textFieldStyle(.roundedBorder)
                Text("→")
                Picker("どの温度？", selection: $outpudDegree) {
                    ForEach (degrees, id: \.self) { degree in
                        Text(degree)
                    }
                }
                Text("\(resultDegree)")
                    .padding(.horizontal,10)
                    .padding(.vertical, 5)
                    .background (
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 1)
                    )

                
            }
            HStack {
                Picker("どの時間?", selection: $inputTime) {
                    ForEach (times, id: \.self) { time in
                        Text(time)
                    }
                }
                TextField("時間の数字入れて", value: $time, format: .number)
                    .textFieldStyle(.roundedBorder)
                Text("→")
                Picker("どの時間？", selection: $outputTime) {
                    ForEach (times, id: \.self) { time in
                        Text(time)
                    }
                }
                Text("\(resultTime)")
                    .padding(.horizontal,10)
                    .padding(.vertical, 5)
                    .background (
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 1)
                    )

                
            }
            
            Button {
                resultDegree = changeDegree(inputDegree: inputDegree, degree: degree, outputDegree: outpudDegree)
                resultTime = changeTime(inputTime: inputTime, time: time, outputTime: outputTime)
                
            } label: {
                Text("変換する")
                    .frame(width: 100, height: 100)
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
