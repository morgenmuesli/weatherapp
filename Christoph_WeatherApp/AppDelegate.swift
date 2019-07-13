//
//  AppDelegate.swift
//  Christoph_WeatherApp
//
//  Created by Christoph Meyer on 07.07.19.
//  Copyright © 2019 Christoph Meyer. All rights reserved.
//

import UIKit
import Moya
import CoreLocation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var restrictRotation:UIInterfaceOrientationMask = .portrait

    let locationService =  LocationService()
    let weatherProvider = MoyaProvider<WeatherService>()
    let viewController = ViewController()
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask
    {
        return self.restrictRotation
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        

        // weather forecast request
        
        locationService.checkLocationServices()
        
        locationService.newestLocation = {
            [weak self] coordinate in
            guard let self = self, let coordinate = coordinate else { return }
            print("Location is: \(coordinate)")
            self.getForecast(for: coordinate)
        }
        
        locationService.statusUpdated = { [weak self] status in
            if status == .authorizedWhenInUse {
                self?.locationService.getLocation()
            }
        }
        
        switch locationService.status {
        case .notDetermined:
            locationService.getPermission()
        case .authorizedWhenInUse:
            locationService.getLocation()
        default: assertionFailure("Location is: \(locationService.status)")
        }


        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        self.window?.rootViewController = viewController
        self.window?.makeKeyAndVisible()

        
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func getForecast(for coordinates: CLLocationCoordinate2D) {
        weatherProvider.request(.current(lat: coordinates.latitude, long: coordinates.longitude)) {(result) in
            switch result {
            case .success(let response):
                do {
                    let forecast = try JSONDecoder().decode(Forecast.self, from: response.data)
                    print("Forecast: \n\n", forecast)
                    let model = CurrentForecastViewModel(currentWeather: forecast)
                    self.viewController.updateInfos(infos: model)
                } catch {
                    print("Failed to get forecast: \(error)")
                }
            case .failure(let error):
                print("Network request failed: \(error)")
            }
        }
    }
    
}

