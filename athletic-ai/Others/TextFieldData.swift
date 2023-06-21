//
//  TextFieldData.swift
//  athletic-ai
//
//  Created by Nurali Rakhay on 20.06.2023.
//

enum InitialSetupData {
    static let genders = ["Male", "Female"]
    static let fitnessLevels = ["Beginner", "Intermediate", "Advanced"]
    static let weights: [Int] = {
        var array = [Int]()
        for weight in 35...200 {
            array.append(weight)
        }
        return array
    }()
    
    static let heights: [Int] = {
        var array = [Int]()
        for weight in 140...220 {
            array.append(weight)
        }
        return array
    }()
}

enum WorkoutPreferencesData {
    static let exercisePreferences = ["Strength Training", "Cardio", "Circuit Training", "Weightlifting", "High-Intensity-Interval-Training"]
    static let workoutPlaces = ["Gym", "Outdoors", "Home"]
    static let workoutsPerWeek: [Int] = {
        var array = [Int]()
        for num in 1...7 {
            array.append(num)
        }
        return array
    }()
    static let intensityLevels = ["Low", "Medium", "High"]
    static let weights: [Int] = {
        var array = [Int]()
        for weight in 35...200 {
            array.append(weight)
        }
        return array
    }()
}
