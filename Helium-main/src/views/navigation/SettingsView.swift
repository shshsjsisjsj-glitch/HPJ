//
//  SettingsView.swift
//  Helium UI
//
//  Created by lemin on 10/19/23.
//

import Foundation
import SwiftUI

let buildNumber: Int = 0
let DEBUG_MODE_ENABLED = false
let USER_DEFAULTS_PATH = "/var/mobile/Library/Preferences/com.leemin.helium.plist"
let NOTIFY_RELOAD_HUD = "com.leemin.notification.hud.reload"


// MARK: Settings View
// TODO: This
struct SettingsView: View {
    // Debug Variables
    @State var sideWidgetSize: Int = 100
    @State var centerWidgetSize: Int = 100
    
    // Preference Variables
    @State var apiKey: String = ""
    @State var dateLocale: String = "en_US"
    @State var hideSaveConfirmation: Bool = false
    @State var debugBorder: Bool = false
    //ESP Button
   @State var DrawLine: Bool = false
   @State var DrawBone: Bool = false
   @State var DrawInfo: Bool = false
   @State var DrawChiQiang: Bool = false
   @State var DrawBack: Bool = false
   
   @State var AimBot: Bool = false
   @State var NoRecoil: Bool = false
   @State var JuDian: Bool = false
   //Aimbot Set
   @State var changesMade: Bool = false
   @State var offsetPX: Double = 0.0
   @State var offsetPY: Double = 0.0
   @State var offsetLX: Double = 0.0
   @State var offsetLY: Double = 0.0
   
   @State var AimBotRadius: Double = 0.0
   @State var AimBotDistance: Double = 0.0

   @State var HideESP: Bool = false
   
   var body: some View {
        NavigationView {
            List {
                // App Version/Build Number
                Section {
                    
                } header: {
                    Label("测试版本By仔仔 3314459549 免费\n可乐 1435202140\n到期时间:2024年12月20日 23:52:33", systemImage: "info")
                }
                
                // Preferences List
                Section {
                   HStack {
                       Toggle(isOn: $DrawLine) {
                           Text("人物绘制")
                               .bold()
                               .minimumScaleFactor(0.5)
                       }
                   }
                   HStack {
                       Toggle(isOn: $DrawBone) {
                           Text("人物骨骼")
                               .bold()
                               .minimumScaleFactor(0.5)
                       }
                   }
                    
                    HStack {
                        Toggle(isOn: $DrawInfo) {
                            Text("人物信息")
                                .bold()
                                .minimumScaleFactor(0.5)
                        }
                    }
                    
                    HStack {
                        Toggle(isOn: $DrawChiQiang) {
                            Text("人物持枪")
                                .bold()
                                .minimumScaleFactor(0.5)
                        }
                    }
                   HStack {
                       Toggle(isOn: $DrawBack) {
                           Text("人物背敌")
                               .bold()
                               .minimumScaleFactor(0.5)
                       }
                   }
                   
                  
                } header: {
                    Label("人物绘制", systemImage: "gear")
                }
                
               
   
                Section {
                
                   HStack {
                       Toggle(isOn: $AimBot) {
                           Text("触摸自瞄")
                               .bold()
                               .minimumScaleFactor(0.5)
                       }
                   }

                   VStack {
                       HStack {
                           Text(NSLocalizedString("瞄准距离", comment: ""))
                               .bold()
                           Spacer()
                       }
                       BetterSlider(value: $AimBotDistance, bounds: 0...500)
                           .onChange(of: AimBotDistance) { _ in
                               changesMade = true
                           }
                   }

                   VStack {
                       HStack {
                           Text(NSLocalizedString("瞄准范围", comment: ""))
                               .bold()
                           Spacer()
                       }
                       BetterSlider(value: $AimBotRadius, bounds: 0...500)
                           .onChange(of: AimBotRadius) { _ in
                               changesMade = true
                           }
                   }
                   
                } header: {
                    Label("进阶功能", systemImage: "wrench.and.screwdriver")
                }
               
               Section {
               
                  HStack {
                      Toggle(isOn: $NoRecoil) {
                          Text("动态无后")
                              .bold()
                              .minimumScaleFactor(0.5)
                      }
                  }
                  HStack {
                      Toggle(isOn: $JuDian) {
                          Text("动态聚点")
                              .bold()
                              .minimumScaleFactor(0.5)
                      }
                  }

                  
               } header: {
                   Label("内存功能", systemImage: "square.and.pencil")
               }
               
             
               Section {
                  HStack {
                      Toggle(isOn: $HideESP) {
                          Text("直播模式")
                              .bold()
                              .minimumScaleFactor(0.5)
                      }
                  }

                  HStack {
                       Text("用户数据")
                           .bold()
                       Spacer()
                       Button(action: {
                           do {
                               try UserDefaults.standard.deleteUserDefaults(forPath: USER_DEFAULTS_PATH)
                               UIApplication.shared.alert(title:"清理成功", body: "请重启APP以生效")
                           } catch {
                               UIApplication.shared.alert(title:"清理失败", body: error.localizedDescription)
                           }
                       }) {
                           Text("清理")
                               .foregroundColor(.red)
                       }
                   }
                  

                  
               } header: {
                   Label("其他设置", systemImage: "app.badge")
               }
               
            }
            .toolbar {
                HStack {
                    Button(action: {
                        saveChanges()
                    }) {
                        Text("保存")
                    }
                }
            }
            .onAppear {
                loadSettings()
            }
            .navigationTitle(Text("绘制配置"))
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }

    func loadSettings() {
       AimBotRadius = UserDefaults.standard.double(forKey: "AimBotRadius", forPath: USER_DEFAULTS_PATH)
       AimBotDistance = UserDefaults.standard.double(forKey: "AimBotDistance", forPath: USER_DEFAULTS_PATH)
       
       
       //ESP
       DrawLine = UserDefaults.standard.bool(forKey: "DrawLine", forPath: USER_DEFAULTS_PATH)
       DrawBone = UserDefaults.standard.bool(forKey: "DrawBone", forPath: USER_DEFAULTS_PATH)
       DrawInfo = UserDefaults.standard.bool(forKey: "DrawInfo", forPath: USER_DEFAULTS_PATH)
       DrawBack = UserDefaults.standard.bool(forKey: "DrawBack", forPath: USER_DEFAULTS_PATH)
       DrawChiQiang = UserDefaults.standard.bool(forKey: "DrawChiQiang", forPath: USER_DEFAULTS_PATH)
       AimBot = UserDefaults.standard.bool(forKey: "AimBot", forPath: USER_DEFAULTS_PATH)
       NoRecoil = UserDefaults.standard.bool(forKey: "NoRecoil", forPath: USER_DEFAULTS_PATH)
       JuDian = UserDefaults.standard.bool(forKey: "JuDian", forPath: USER_DEFAULTS_PATH)
      // HideESP = UserDefaults.standard.string(forKey: "HideESP", forPath: USER_DEFAULTS_PATH)??"关闭"
       HideESP = UserDefaults.standard.bool(forKey: "HideESP", forPath: USER_DEFAULTS_PATH)
       
    }

    func saveChanges() {
     
        UIApplication.shared.alert(title: "保存设置", body: "设置保存成功")
       UserDefaults.standard.setValue(DrawLine, forKey: "DrawLine", forPath: USER_DEFAULTS_PATH)
       UserDefaults.standard.setValue(DrawBone, forKey: "DrawBone", forPath: USER_DEFAULTS_PATH)
       UserDefaults.standard.setValue(DrawInfo, forKey: "DrawInfo", forPath: USER_DEFAULTS_PATH)
       UserDefaults.standard.setValue(DrawBack, forKey: "DrawBack", forPath: USER_DEFAULTS_PATH)
       UserDefaults.standard.setValue(DrawChiQiang, forKey: "DrawChiQiang", forPath: USER_DEFAULTS_PATH)
       UserDefaults.standard.setValue(AimBot, forKey: "AimBot", forPath: USER_DEFAULTS_PATH)
       UserDefaults.standard.setValue(NoRecoil, forKey: "NoRecoil", forPath: USER_DEFAULTS_PATH)
       UserDefaults.standard.setValue(JuDian, forKey: "JuDian", forPath: USER_DEFAULTS_PATH)
       UserDefaults.standard.setValue(HideESP, forKey: "HideESP", forPath: USER_DEFAULTS_PATH)
       
       UserDefaults.standard.setValue(AimBotRadius, forKey: "AimBotRadius", forPath: USER_DEFAULTS_PATH)
       UserDefaults.standard.setValue(AimBotDistance, forKey: "AimBotDistance", forPath: USER_DEFAULTS_PATH)
       
       DarwinNotificationCenter.default.post(name: NOTIFY_RELOAD_HUD)
    }
    
    // Link Cell code from Cowabunga
    struct LinkCell: View {
        var imageName: String
        var url: String
        var title: String
        var contribution: String
        var systemImage: Bool = false
        var circle: Bool = false
        
        var body: some View {
            HStack(alignment: .center) {
                Group {
                    if systemImage {
                        Image(systemName: imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } else {
                        if imageName != "" {
                            Image(imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                    }
                }
                .cornerRadius(circle ? .infinity : 0)
                .frame(width: 24, height: 24)
                
                VStack {
                    HStack {
                        Button(action: {
                            if url != "" {
                                UIApplication.shared.open(URL(string: url)!)
                            }
                        }) {
                            Text(title)
                                .fontWeight(.bold)
                        }
                        .padding(.horizontal, 6)
                        Spacer()
                    }
                    HStack {
                        Text(contribution)
                            .padding(.horizontal, 6)
                            .font(.footnote)
                        Spacer()
                    }
                }
            }
            .foregroundColor(.blue)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
