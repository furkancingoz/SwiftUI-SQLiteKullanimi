//
//  ContentView.swift
//  SQLiteKullanimi
//
//  Created by Furkan Cingöz on 6.04.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("")
            .onAppear{
                veritabaniKopyala()
                let kdao = KisilerDao()
                
                // kdao.kaydet(kisi_adi: "Bora", kisi_tel: "1505")
                // kdao.guncelle(kisiler_id: 2, kisi_adi: "Sıla", kisi_tel: "3105")
                // kdao.guncelle(kisiler_id: 1, kisi_adi: "Furkan", kisi_tel: "0608")
                // kdao.sil(kisiler_id: 4)
                // kdao.tumKisiler()
                // kdao.getir(kisiler_id: 2)
                // kdao.arama(aramaKelimesi: "f")
                // kdao.rastgele1KisiGetir()
                kdao.kontrol(kisi_adi: "Furkan")
            }
    }
    func veritabaniKopyala(){
        let bundle = Bundle.main.path(forResource: "Rehber", ofType: ".sqlite")
        let veritabaniyolu = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let hedefYol = URL(fileURLWithPath: veritabaniyolu).appendingPathComponent("Rehber.sqlite")
        
        let fm = FileManager.default
        
        if fm.fileExists(atPath: hedefYol.path) {
            print("Veri tabanı daha önce kopyalandı")
        } else {
            do {
                try fm.copyItem(atPath: bundle!, toPath: hedefYol.path)
                print("Veri tabanı kopyalanıyor...")
            }catch{
                print(error.localizedDescription)
            }
        }
    }
}

#Preview {
    ContentView()
}
