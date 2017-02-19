//
//  DB.swift
//  MoneyManager
//
//  Created by Thai Duong on 2/18/17.
//  Copyright © 2017 ThaiDuong. All rights reserved.
//

import Foundation
import RealmSwift
class DB {
    let realm = try! Realm()
    
    let index : Dictionary<String,[String]>! = ["Ăn uống":["Ăn tiệm","Đi chợ/siêu thị","Cafe"],"Dịch vụ sinh hoạt":["Điện","Nước","Internet","Điện thoại di động","Gas","Truyền hinh","Điện thoại cố định","Thuê người giúp việc"],"Trang phục":["Quần áo","Giầy dép","Phụ kiện khác"],"Đi lại":["Xăng xe","Bảo hiểm xe","Sửa chữa , bảo dưỡng xe","Gửi xe","Rửa xe","Taxi/thuê xe"],"Hưởng thụ":["Vui chơi giải trí","Du lịch","Làm đẹp","Phim ảnh ca nhạc","Mỹ phẩm"],"Sức khỏe":["Khám chữa bệnh","Thuốc men","Thể thao"],"Con cái":["Học phí","Sách vở","Sữa","Đồ Chơi","Tiền tiêu vặt"],"Phát triển bản thân":["Học hành","Giao lưu, quan hệ"],"Nhà cửa":["Mua sắm đồ đạc","Sửa chữa nhà cửa","Thuê nhà"],"Hiếu hỉ":["Cưới xin","Ma chay","Thăm hỏi","Biếu tặng"]]
    
    let account = ["Ví","ATM","Tài khoản đầu tư"]
    
    class func share() -> DB{
        let share = DB()
        return share
    }
    
    
    func writeData(obj : Object){
        try! realm.write {
            realm.add(obj)
            print("add")
        }
    }
    
    func queryIndex() -> Results<Index>{
        let data = realm.objects(Index.self)
        return data
    }
    
    func queryAccount() -> Results<Account>{
        let data = realm.objects(Account.self)
        return data
    }
    
    func setupBasicDB() {
        let indexKeys = Array(index.keys)
        for i in 0...indexKeys.count-1 {
            let indexObj = Index()
            indexObj.dadName = indexKeys[i]
            let ind = index[indexKeys[i]]!
            for j in 0...ind.count-1 {
                let indexChil = ChildIndex()
                indexChil.childName = ind[j]
                indexObj.childName.append(indexChil)
            }
            writeData(obj: indexObj)
        }
        
        for acc in 0...account.count - 1 {
            let acc1 = Account()
            acc1.nameAcc = account[acc]
            if acc == 0 {
                acc1.image = "account_wallet.png"
            } else if acc == 1 {
                acc1.image = "bank.png"
            } else if acc == 2 {
                acc1.image = "account_invest.png"
            }
            self.writeData(obj: acc1)
        }
    }
    
    func insertChildToParentIndex(parentName :String , child : ChildIndex) {
        let index = realm.objects(Index.self).filter("dadName = %@",parentName).first
        
        try! realm.write {
            index?.childName.append(child)
        }
    }
    
    func saveRecord(record : Record){
        try! realm.write {
            realm.add(record)
        }
    }
}
