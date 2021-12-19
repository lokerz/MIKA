//
//  Constant.swift
//  MIKA
//
//  Created by Ridwan on 19/12/21.
//

import Foundation

class Constant {
    struct Filter {
        enum Category {
            case Hospital, Specialization
        }
        static let Hospital = [ "Mitra Keluarga Bintaro",
                                "Mitra Keluarga Gading Serpong",
                                "Mitra Keluarga Bekasi",
                                "Mitra Keluarga Cibubur",
                                "Mitra Keluarga Depok",
                                "Mitra Keluarga Kemayoran"]
        static let Specialization = ["Dokter Umum",
                                     "Dokter Spesialis Anak",
                                     "Dokter Spesialis Penyakit Dalam",
                                     "Dokter Spesialis Kebidanan & Kandungan",
                                     "Dokter Spesialis Bedah",
                                     "Dokter Spesialis Jantung & Pem. Darah",
                                     "Dokter Spesialis Kulit & Kelamin"]
    }
}
