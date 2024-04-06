//
//  KisilerDao.swift
//  SQLiteKullanimi
//
//  Created by Furkan Cingöz on 6.04.2024.
//

import Foundation

class KisilerDao{
    let db:FMDatabase?
    
    init(){
        let veritabaniyolu = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let hedefYol = URL(fileURLWithPath: veritabaniyolu).appendingPathComponent("Rehber.sqlite")
        db = FMDatabase(path: hedefYol.path())
    }
    
    func tumKisiler() {
        db?.open()
        do {
            let result = try db!.executeQuery("SELECT * FROM kisiler", values: nil)
            
            while result.next() {
                let kisi_id = Int(result.string(forColumn: "kisiler_id"))!
                let kisi_ad = result.string(forColumn: "kisi_adi")!
                let kisi_tel = result.string(forColumn: "kisi_tel")!
                
                print("--------------")
                print("Kişi ID: \(kisi_id)")
                print("Kişi Adı: \(kisi_ad)")
                print("Kişi Tel: \(kisi_tel)")
            }
        }catch{
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func kaydet(kisi_adi:String,kisi_tel:String){
        db?.open()
        do{
            try db!.executeUpdate("INSERT INTO kisiler (kisi_adi,kisi_tel) VALUES (?,?)", values: [kisi_adi,kisi_tel])
        }catch{
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func guncelle(kisiler_id:Int,kisi_adi:String,kisi_tel:String){
        db?.open()
        do{
            try db!.executeUpdate("UPDATE kisiler SET kisi_adi = ? , kisi_tel = ? WHERE kisiler_id = ?",values: [kisi_adi,kisi_tel,kisiler_id])
        }catch{
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func sil(kisiler_id:Int) {
        db?.open()
        do{
            try db!.executeUpdate("DELETE FROM kisiler WHERE kisiler_id = ?", values: [kisiler_id])
        }catch{
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func getir(kisiler_id:Int) {
        db?.open()
        do {
            let result = try db!.executeQuery("SELECT * FROM kisiler WHERE kisiler_id = ? " , values: [kisiler_id])
            
            while result.next() {
                let kisi_id = Int(result.string(forColumn: "kisiler_id"))!
                let kisi_ad = result.string(forColumn: "kisi_adi")!
                let kisi_tel = result.string(forColumn: "kisi_tel")!
                
                print("--------------")
                print("Kişi ID: \(kisi_id)")
                print("Kişi Adı: \(kisi_ad)")
                print("Kişi Tel: \(kisi_tel)")
            }
        }catch{
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func arama(aramaKelimesi : String) {
        db?.open()
        do{
            let result = try db!.executeQuery("SELECT * FROM kisiler WHERE kisi_adi like ?  ", values: ["%\(aramaKelimesi)%"] )
            
            while result.next() {
                let kisi_id = Int(result.string(forColumn: "kisiler_id"))!
                let kisi_ad = result.string(forColumn: "kisi_adi")!
                let kisi_tel = result.string(forColumn: "kisi_tel")!
                
                print("--------------")
                print("Kişi ID: \(kisi_id)")
                print("Kişi Adı: \(kisi_ad)")
                print("Kişi Tel: \(kisi_tel)")
            }
        }catch{
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func rastgele1KisiGetir() {
        db?.open()
        do{
            let result = try db!.executeQuery("SELECT * FROM kisiler ORDER BY RANDOM() LIMIT 1 ", values: nil )
            
            while result.next() {
                let kisi_id = Int(result.string(forColumn: "kisiler_id"))!
                let kisi_ad = result.string(forColumn: "kisi_adi")!
                let kisi_tel = result.string(forColumn: "kisi_tel")!
                
                print("--------------")
                print("Kişi ID: \(kisi_id)")
                print("Kişi Adı: \(kisi_ad)")
                print("Kişi Tel: \(kisi_tel)")
            }
        }catch{
            print(error.localizedDescription)
        }
        db?.close()
    }
}
