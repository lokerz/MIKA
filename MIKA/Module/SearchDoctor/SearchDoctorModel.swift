//
//  SearchDoctorModel.swift
//  MIKA
//
//  Created by Ridwan on 18/12/21.
//

import Foundation


protocol SearchDoctorViewModelProtocol {
    func fetchDoctorList(key: String)
    func getDoctorList() -> [Doctor]
}

protocol SearchDoctorViewControllerProtocol {
    func refreshData()
}

struct Doctor: Decodable {
    var name : String?
    var overview : String?
    var about: String?
    var photo : Photo?
    var hospital : [Hospital]?
    var price: Price?
    
    enum CodingKeys: String, CodingKey {
        case name, overview, about, photo, hospital, price
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        overview = try values.decodeIfPresent(String.self, forKey: .overview)
        about = try values.decodeIfPresent(String.self, forKey: .about)
        photo = try values.decodeIfPresent(Photo.self, forKey: .photo)
        hospital = try values.decodeIfPresent([Hospital].self, forKey: .hospital)
        price = try values.decodeIfPresent(Price.self, forKey: .price)
    }
    
    struct Photo: Decodable {
        var url : String?
        
        enum CodingKeys: String, CodingKey {
            case url
        }
        
        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            url = try values.decodeIfPresent(String.self, forKey: .url)
        }
        
    }
    
    struct Hospital: Decodable {
        var name : String?
        
        enum CodingKeys: String, CodingKey {
            case name
        }
        
        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            name = try values.decodeIfPresent(String.self, forKey: .name)
        }
    }
    
    struct Price: Decodable {
        var raw: Int?
        var formatted: String?
        
        enum CodingKeys: String, CodingKey {
            case raw, formatted
        }
        
        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            raw = try values.decodeIfPresent(Int.self, forKey: .raw)
            formatted = try values.decodeIfPresent(String.self, forKey: .formatted)
        }
    }
}
//
//{
//   "status":true,
//   "message":"OK",
//   "data":[
//      {
//         "doctor_id":"60c9fbf0a3325900127b77d7",
//         "name":"dr. Leony Nerry Sabatini Tambunan",
//         "slug":"dr.-leony-nerry-sabatini-tambunan",
//         "is_popular":true,
//         "about":"<p><span style=\"background-color:rgb(255,255,255);color:rgb(0,0,0);\">&nbsp;dr. Leony Nerry Sabatini Tambunan adalah&nbsp;Dokter&nbsp;Umum&nbsp;yang&nbsp;telah&nbsp;menyelesaikan&nbsp;pendidikan&nbsp;di Universitas Pelita Harapan. Beliau dapat memberikan&nbsp;pelayanan&nbsp;medis&nbsp;/&nbsp;konsultasi&nbsp;terkait&nbsp;kondisi penyakit umum.&nbsp;</span></p>",
//         "overview":"Dokter Umum",
//         "photo":{
//            "size_formatted":"891.1 KB",
//            "url":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/dr_Leony_Nerry_Sabatini_Tambunan_670ab042e6.png",
//            "formats":{
//               "thumbnail":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/thumbnail_dr_Leony_Nerry_Sabatini_Tambunan_670ab042e6.png",
//               "large":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/large_dr_Leony_Nerry_Sabatini_Tambunan_670ab042e6.png",
//               "medium":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/medium_dr_Leony_Nerry_Sabatini_Tambunan_670ab042e6.png",
//               "small":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/small_dr_Leony_Nerry_Sabatini_Tambunan_670ab042e6.png"
//            }
//         },
//         "sip":"446.1/0716/01-DPMPTSP/OL/2019",
//         "experience":"3 Tahun Pengalaman",
//         "price":{
//            "raw":50000,
//            "formatted":"Rp 50.000"
//         },
//         "specialization":{
//            "id":"607d0aaa9be06e0012f2094b",
//            "name":"Dokter Umum"
//         },
//         "hospital":[
//            {
//               "id":"60c9d8289b299d0012f4ee28",
//               "name":"Mitra Keluarga Bintaro",
//               "image":{
//                  "size_formatted":"767.88 KB",
//                  "url":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/MK_KG_656b684faf_38207250c3.jpg",
//                  "formats":{
//                     "thumbnail":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/thumbnail_MK_KG_656b684faf_38207250c3.jpg",
//                     "large":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/large_MK_KG_656b684faf_38207250c3.jpg",
//                     "medium":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/medium_MK_KG_656b684faf_38207250c3.jpg",
//                     "small":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/small_MK_KG_656b684faf_38207250c3.jpg"
//                  }
//               },
//               "icon":{
//                  "size_formatted":"16.83 KB",
//                  "url":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/logo_MIKA_83f14601a0_74a120471a.png",
//                  "formats":{
//                     "thumbnail":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/thumbnail_logo_MIKA_83f14601a0_74a120471a.png",
//                     "large":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/logo_MIKA_83f14601a0_74a120471a.png",
//                     "medium":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/medium_logo_MIKA_83f14601a0_74a120471a.png",
//                     "small":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/small_logo_MIKA_83f14601a0_74a120471a.png"
//                  }
//               }
//            }
//         ],
//         "about_preview":"&nbsp;dr. Leony Nerry Sabatini Tambunan adalah&nbsp;Dokter&nbsp;Umum&nbsp;yang&nbsp;telah&nbsp;menyelesaikan&nbsp;pendidikan&nbsp;di Universitas Pelita Harapan. Beliau dapat memberikan&nbsp;pelayanan&nbsp;medis&nbsp;/&nbsp;konsultasi&nbsp;terkait&nbsp;kondisi penyakit umum.&nbsp;"
//      },
//      {
//         "doctor_id":"60c9fc2fa3325900127b77d8",
//         "name":"dr. Benita Deselina,Sp.A",
//         "slug":"dr.-benita-deselinasp.a",
//         "is_popular":true,
//         "about":"<p><span style=\"background-color:rgb(255,255,255);color:rgb(0,0,0);\">&nbsp;dr. Benita Deselina,Sp.A adalah&nbsp;Dokter&nbsp;Spesialis Anak&nbsp;yang&nbsp;telah&nbsp;menyelesaikan&nbsp;pendidikan&nbsp;di Universitas Indonesia. Beliau dapat memberikan&nbsp;pelayanan&nbsp;medis&nbsp;/&nbsp;konsultasi&nbsp;terkait&nbsp;<strong>kondisi penyakit pada anak.&nbsp;</strong></span></p>",
//         "overview":"Dokter Spesialis Anak",
//         "photo":{
//            "size_formatted":"49.51 KB",
//            "url":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/dr_Benita_Sp_A_58b02c90dd.png",
//            "formats":{
//               "thumbnail":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/thumbnail_dr_Benita_Sp_A_58b02c90dd.png",
//               "large":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/dr_Benita_Sp_A_58b02c90dd.png",
//               "medium":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/medium_dr_Benita_Sp_A_58b02c90dd.png",
//               "small":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/small_dr_Benita_Sp_A_58b02c90dd.png"
//            }
//         },
//         "sip":"446.3/0725/03-DPMPTSP/OL/2019",
//         "experience":"20 Tahun Pengalaman",
//         "price":{
//            "raw":200000,
//            "formatted":"Rp 200.000"
//         },
//         "specialization":{
//            "id":"607d01ca3925ca001231fae3",
//            "name":"Anak"
//         },
//         "hospital":[
//            {
//               "id":"60c9d8289b299d0012f4ee28",
//               "name":"Mitra Keluarga Bintaro",
//               "image":{
//                  "size_formatted":"767.88 KB",
//                  "url":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/MK_KG_656b684faf_38207250c3.jpg",
//                  "formats":{
//                     "thumbnail":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/thumbnail_MK_KG_656b684faf_38207250c3.jpg",
//                     "large":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/large_MK_KG_656b684faf_38207250c3.jpg",
//                     "medium":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/medium_MK_KG_656b684faf_38207250c3.jpg",
//                     "small":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/small_MK_KG_656b684faf_38207250c3.jpg"
//                  }
//               },
//               "icon":{
//                  "size_formatted":"16.83 KB",
//                  "url":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/logo_MIKA_83f14601a0_74a120471a.png",
//                  "formats":{
//                     "thumbnail":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/thumbnail_logo_MIKA_83f14601a0_74a120471a.png",
//                     "large":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/logo_MIKA_83f14601a0_74a120471a.png",
//                     "medium":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/medium_logo_MIKA_83f14601a0_74a120471a.png",
//                     "small":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/small_logo_MIKA_83f14601a0_74a120471a.png"
//                  }
//               }
//            }
//         ],
//         "about_preview":"&nbsp;dr. Benita Deselina,Sp.A adalah&nbsp;Dokter&nbsp;Spesialis Anak&nbsp;yang&nbsp;telah&nbsp;menyelesaikan&nbsp;pendidikan&nbsp;di Universitas Indonesia. Beliau dapat memberikan&nbsp;pelayanan&nbsp;medis&nbsp;/&nbsp;konsultasi&nbsp;terkait&nbsp;kondisi penyakit pada anak.&nbsp;"
//      },
//      {
//         "doctor_id":"60c9fc5aa3325900127b77d9",
//         "name":"dr. Melisa Lilisari,Sp.A",
//         "slug":"dr.-melisa-lilisarisp.a",
//         "is_popular":true,
//         "about":"<p><span style=\"background-color:rgb(255,255,255);color:rgb(0,0,0);\">&nbsp;dr. Melisa Lilisari,Sp.A adalah&nbsp;Dokter&nbsp;Spesialis Anak&nbsp;yang&nbsp;</span><span style=\"color:rgb(0,0,0);\">telah</span><span style=\"background-color:rgb(255,255,255);color:rgb(0,0,0);\">&nbsp;menyelesaikan&nbsp;pendidikan&nbsp;di Universitas Padjajaran. Beliau dapat memberikan&nbsp;pelayanan&nbsp;medis&nbsp;/&nbsp;konsultasi&nbsp;terkait&nbsp;kondisi penyakit pada anak.&nbsp;</span></p>",
//         "overview":"Dokter Spesialis Anak",
//         "photo":{
//            "size_formatted":"139.83 KB",
//            "url":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/dr_Melisa_Sp_A_2f3e933b06.png",
//            "formats":{
//               "thumbnail":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/thumbnail_dr_Melisa_Sp_A_2f3e933b06.png",
//               "large":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/large_dr_Melisa_Sp_A_2f3e933b06.png",
//               "medium":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/medium_dr_Melisa_Sp_A_2f3e933b06.png",
//               "small":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/small_dr_Melisa_Sp_A_2f3e933b06.png"
//            }
//         },
//         "sip":"446.3/0094/01/DPMPTSP/OL/2020",
//         "experience":"7 Tahun Pengalaman",
//         "price":{
//            "raw":200000,
//            "formatted":"Rp 200.000"
//         },
//         "specialization":{
//            "id":"607d01ca3925ca001231fae3",
//            "name":"Anak"
//         },
//         "hospital":[
//            {
//               "id":"60c9d8289b299d0012f4ee28",
//               "name":"Mitra Keluarga Bintaro",
//               "image":{
//                  "size_formatted":"767.88 KB",
//                  "url":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/MK_KG_656b684faf_38207250c3.jpg",
//                  "formats":{
//                     "thumbnail":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/thumbnail_MK_KG_656b684faf_38207250c3.jpg",
//                     "large":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/large_MK_KG_656b684faf_38207250c3.jpg",
//                     "medium":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/medium_MK_KG_656b684faf_38207250c3.jpg",
//                     "small":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/small_MK_KG_656b684faf_38207250c3.jpg"
//                  }
//               },
//               "icon":{
//                  "size_formatted":"16.83 KB",
//                  "url":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/logo_MIKA_83f14601a0_74a120471a.png",
//                  "formats":{
//                     "thumbnail":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/thumbnail_logo_MIKA_83f14601a0_74a120471a.png",
//                     "large":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/logo_MIKA_83f14601a0_74a120471a.png",
//                     "medium":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/medium_logo_MIKA_83f14601a0_74a120471a.png",
//                     "small":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/small_logo_MIKA_83f14601a0_74a120471a.png"
//                  }
//               }
//            }
//         ],
//         "about_preview":"&nbsp;dr. Melisa Lilisari,Sp.A adalah&nbsp;Dokter&nbsp;Spesialis Anak&nbsp;yang&nbsp;telah&nbsp;menyelesaikan&nbsp;pendidikan&nbsp;di Universitas Padjajaran. Beliau dapat memberikan&nbsp;pelayanan&nbsp;medis&nbsp;/&nbsp;konsultasi&nbsp;terkait&nbsp;kondisi penyakit pada anak.&nbsp;"
//      },
//      {
//         "doctor_id":"60c9fc8dcb0e2e001240840c",
//         "name":"dr. Astrid Budiman, Sp.PD",
//         "slug":"dr.-astrid-budiman-sp.pd",
//         "is_popular":true,
//         "about":"<p><span style=\"background-color:rgb(255,255,255);color:rgb(0,0,0);\">&nbsp;dr. Astrid Budiman,Sp.PD adalah&nbsp;Dokter&nbsp;Spesialis Penyakit Dalam&nbsp;yang&nbsp;telah&nbsp;menyelesaikan&nbsp;pendidikan&nbsp;di Jose R. Reyes Medical Center Manila, Filipina. Beliau dapat memberikan&nbsp;pelayanan&nbsp;medis&nbsp;/&nbsp;konsultasi&nbsp;terkait&nbsp;kondisi penyakit dalam.&nbsp;</span></p>",
//         "overview":"Dokter Spesialis Penyakit Dalam",
//         "photo":{
//            "size_formatted":"235.39 KB",
//            "url":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/dr_Astrid_sp_PD_7733008580.png",
//            "formats":{
//               "thumbnail":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/thumbnail_dr_Astrid_sp_PD_7733008580.png",
//               "large":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/large_dr_Astrid_sp_PD_7733008580.png",
//               "medium":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/medium_dr_Astrid_sp_PD_7733008580.png",
//               "small":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/small_dr_Astrid_sp_PD_7733008580.png"
//            }
//         },
//         "sip":"446.3/0835/02-DPMPTSP/OL/2019",
//         "experience":"4 Tahun Pengalaman",
//         "price":{
//            "raw":200000,
//            "formatted":"Rp 200.000"
//         },
//         "specialization":{
//            "id":"607d074c3925ca001231fafe",
//            "name":"Penyakit Dalam"
//         },
//         "hospital":[
//            {
//               "id":"60c9d8289b299d0012f4ee28",
//               "name":"Mitra Keluarga Bintaro",
//               "image":{
//                  "size_formatted":"767.88 KB",
//                  "url":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/MK_KG_656b684faf_38207250c3.jpg",
//                  "formats":{
//                     "thumbnail":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/thumbnail_MK_KG_656b684faf_38207250c3.jpg",
//                     "large":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/large_MK_KG_656b684faf_38207250c3.jpg",
//                     "medium":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/medium_MK_KG_656b684faf_38207250c3.jpg",
//                     "small":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/small_MK_KG_656b684faf_38207250c3.jpg"
//                  }
//               },
//               "icon":{
//                  "size_formatted":"16.83 KB",
//                  "url":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/logo_MIKA_83f14601a0_74a120471a.png",
//                  "formats":{
//                     "thumbnail":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/thumbnail_logo_MIKA_83f14601a0_74a120471a.png",
//                     "large":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/logo_MIKA_83f14601a0_74a120471a.png",
//                     "medium":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/medium_logo_MIKA_83f14601a0_74a120471a.png",
//                     "small":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/small_logo_MIKA_83f14601a0_74a120471a.png"
//                  }
//               }
//            }
//         ],
//         "about_preview":"&nbsp;dr. Astrid Budiman,Sp.PD adalah&nbsp;Dokter&nbsp;Spesialis Penyakit Dalam&nbsp;yang&nbsp;telah&nbsp;menyelesaikan&nbsp;pendidikan&nbsp;di Jose R. Reyes Medical Center Manila, Filipina. Beliau dapat"
//      },
//      {
//         "doctor_id":"60c9fccca3325900127b77da",
//         "name":"dr. Okki Ramadian,Sp.PD",
//         "slug":"dr.-okki-ramadiansp.pd",
//         "is_popular":true,
//         "about":"<p><span style=\"background-color:rgb(255,255,255);color:rgb(0,0,0);\">&nbsp;dr. Okki Ramadian,Sp.PD adalah&nbsp;Dokter&nbsp;Spesialis Penyakit Dalam&nbsp;yang&nbsp;</span><span style=\"color:rgb(0,0,0);\">telah</span><span style=\"background-color:rgb(255,255,255);color:rgb(0,0,0);\">&nbsp;menyelesaikan&nbsp;pendidikan&nbsp;di Universitas Indonesia. Beliau dapat memberikan&nbsp;pelayanan&nbsp;medis&nbsp;/&nbsp;konsultasi&nbsp;terkait&nbsp;kondisi penyakit dalam.&nbsp;</span></p>",
//         "overview":"Dokter Spesialis Penyakit Dalam",
//         "photo":{
//            "size_formatted":"114.58 KB",
//            "url":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/dr_Okki_Ramadian_Sp_PD_69240b791b.png",
//            "formats":{
//               "thumbnail":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/thumbnail_dr_Okki_Ramadian_Sp_PD_69240b791b.png",
//               "large":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/large_dr_Okki_Ramadian_Sp_PD_69240b791b.png",
//               "medium":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/medium_dr_Okki_Ramadian_Sp_PD_69240b791b.png",
//               "small":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/small_dr_Okki_Ramadian_Sp_PD_69240b791b.png"
//            }
//         },
//         "sip":"446.3/1091/01-DPMPTSP/OL/2019",
//         "experience":"13 Tahun Pengalaman",
//         "price":{
//            "raw":200000,
//            "formatted":"Rp 200.000"
//         },
//         "specialization":{
//            "id":"607d074c3925ca001231fafe",
//            "name":"Penyakit Dalam"
//         },
//         "hospital":[
//            {
//               "id":"60c9d8289b299d0012f4ee28",
//               "name":"Mitra Keluarga Bintaro",
//               "image":{
//                  "size_formatted":"767.88 KB",
//                  "url":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/MK_KG_656b684faf_38207250c3.jpg",
//                  "formats":{
//                     "thumbnail":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/thumbnail_MK_KG_656b684faf_38207250c3.jpg",
//                     "large":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/large_MK_KG_656b684faf_38207250c3.jpg",
//                     "medium":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/medium_MK_KG_656b684faf_38207250c3.jpg",
//                     "small":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/small_MK_KG_656b684faf_38207250c3.jpg"
//                  }
//               },
//               "icon":{
//                  "size_formatted":"16.83 KB",
//                  "url":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/logo_MIKA_83f14601a0_74a120471a.png",
//                  "formats":{
//                     "thumbnail":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/thumbnail_logo_MIKA_83f14601a0_74a120471a.png",
//                     "large":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/logo_MIKA_83f14601a0_74a120471a.png",
//                     "medium":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/medium_logo_MIKA_83f14601a0_74a120471a.png",
//                     "small":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/small_logo_MIKA_83f14601a0_74a120471a.png"
//                  }
//               }
//            }
//         ],
//         "about_preview":"&nbsp;dr. Okki Ramadian,Sp.PD adalah&nbsp;Dokter&nbsp;Spesialis Penyakit Dalam&nbsp;yang&nbsp;telah&nbsp;menyelesaikan&nbsp;pendidikan&nbsp;di Universitas Indonesia. Beliau dapat memberikan&nbsp;pelayanan&nbsp;medis&nbsp;/&nbsp;konsultasi&nbsp;terkait&nbsp;kondisi penyakit dalam.&nbsp;"
//      },
//      {
//         "doctor_id":"60c9fd00a3325900127b77db",
//         "name":"dr. Jasmine Iskandar,Sp.OG",
//         "slug":"dr.-jasmine-iskandarsp.og",
//         "is_popular":true,
//         "about":"<p><span style=\"background-color:rgb(255,255,255);color:rgb(0,0,0);\">&nbsp;dr. Jasmine Iskandar,Sp.OG adalah&nbsp;Dokter&nbsp;Spesialis Penyakit Kebidanan dan Kandungan&nbsp;yang&nbsp;telah&nbsp;menyelesaikan&nbsp;pendidikan&nbsp;di Universitas Indonesia. Beliau dapat memberikan&nbsp;pelayanan&nbsp;medis&nbsp;/&nbsp;konsultasi&nbsp;terkait&nbsp;kondisi penyakit kebidanan dan kandungan.&nbsp;</span></p>",
//         "overview":"Dokter Spesialis Kebidanan & Kandungan",
//         "photo":{
//            "size_formatted":"140.9 KB",
//            "url":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/dr_Jasmine_Iskandar_Sp_OG_edc4118ef1.png",
//            "formats":{
//               "thumbnail":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/thumbnail_dr_Jasmine_Iskandar_Sp_OG_edc4118ef1.png",
//               "large":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/large_dr_Jasmine_Iskandar_Sp_OG_edc4118ef1.png",
//               "medium":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/medium_dr_Jasmine_Iskandar_Sp_OG_edc4118ef1.png",
//               "small":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/small_dr_Jasmine_Iskandar_Sp_OG_edc4118ef1.png"
//            }
//         },
//         "sip":"446.3/2072/03-DPMPTSP/OL/2020",
//         "experience":"4 Tahun Pengalaman",
//         "price":{
//            "raw":200000,
//            "formatted":"Rp 200.000"
//         },
//         "specialization":{
//            "id":"607d06b63925ca001231faf9",
//            "name":"Kebidanan & Kandungan"
//         },
//         "hospital":[
//            {
//               "id":"60c9d8289b299d0012f4ee28",
//               "name":"Mitra Keluarga Bintaro",
//               "image":{
//                  "size_formatted":"767.88 KB",
//                  "url":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/MK_KG_656b684faf_38207250c3.jpg",
//                  "formats":{
//                     "thumbnail":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/thumbnail_MK_KG_656b684faf_38207250c3.jpg",
//                     "large":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/large_MK_KG_656b684faf_38207250c3.jpg",
//                     "medium":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/medium_MK_KG_656b684faf_38207250c3.jpg",
//                     "small":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/small_MK_KG_656b684faf_38207250c3.jpg"
//                  }
//               },
//               "icon":{
//                  "size_formatted":"16.83 KB",
//                  "url":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/logo_MIKA_83f14601a0_74a120471a.png",
//                  "formats":{
//                     "thumbnail":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/thumbnail_logo_MIKA_83f14601a0_74a120471a.png",
//                     "large":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/logo_MIKA_83f14601a0_74a120471a.png",
//                     "medium":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/medium_logo_MIKA_83f14601a0_74a120471a.png",
//                     "small":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/small_logo_MIKA_83f14601a0_74a120471a.png"
//                  }
//               }
//            }
//         ],
//         "about_preview":"&nbsp;dr. Jasmine Iskandar,Sp.OG adalah&nbsp;Dokter&nbsp;Spesialis Penyakit Kebidanan dan Kandungan&nbsp;yang&nbsp;telah&nbsp;menyelesaikan&nbsp;pendidikan&nbsp;di Universitas Indonesia. Beliau dapat memberikan&nbsp;pelayanan&nbsp;medis&nbsp;/&nbsp;konsultasi&nbsp;terkait&nbsp;kondisi penyakit kebidanan"
//      },
//      {
//         "doctor_id":"60c9fd33a3325900127b77dc",
//         "name":"dr. Dennis William Pratama,Sp.B",
//         "slug":"dr.-dennis-william-pratamasp.b",
//         "is_popular":true,
//         "about":"<p><span style=\"background-color:rgb(255,255,255);color:rgb(0,0,0);\">&nbsp;dr. Dennis William Pratama,Sp.B adalah&nbsp;Dokter&nbsp;Spesialis Bedah&nbsp;yang&nbsp;telah&nbsp;menyelesaikan&nbsp;pendidikan&nbsp;di Universitas Indonesia. Beliau dapat memberikan&nbsp;pelayanan&nbsp;medis&nbsp;/&nbsp;konsultasi&nbsp;terkait&nbsp;kondisi penyakit bedah.&nbsp;</span></p>",
//         "overview":"Dokter Spesialis Bedah",
//         "photo":{
//            "size_formatted":"124.47 KB",
//            "url":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/dr_Dennis_William_Pratama_Sp_B_c2c2fe5c4d.png",
//            "formats":{
//               "thumbnail":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/thumbnail_dr_Dennis_William_Pratama_Sp_B_c2c2fe5c4d.png",
//               "large":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/large_dr_Dennis_William_Pratama_Sp_B_c2c2fe5c4d.png",
//               "medium":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/medium_dr_Dennis_William_Pratama_Sp_B_c2c2fe5c4d.png",
//               "small":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/small_dr_Dennis_William_Pratama_Sp_B_c2c2fe5c4d.png"
//            }
//         },
//         "sip":"446.3/0014/03-DPMPTSP/OL/2020",
//         "experience":"6 Tahun Pengalaman",
//         "price":{
//            "raw":200000,
//            "formatted":"Rp 200.000"
//         },
//         "specialization":{
//            "id":"607d03fd3925ca001231faeb",
//            "name":"Bedah"
//         },
//         "hospital":[
//            {
//               "id":"60c9d8289b299d0012f4ee28",
//               "name":"Mitra Keluarga Bintaro",
//               "image":{
//                  "size_formatted":"767.88 KB",
//                  "url":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/MK_KG_656b684faf_38207250c3.jpg",
//                  "formats":{
//                     "thumbnail":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/thumbnail_MK_KG_656b684faf_38207250c3.jpg",
//                     "large":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/large_MK_KG_656b684faf_38207250c3.jpg",
//                     "medium":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/medium_MK_KG_656b684faf_38207250c3.jpg",
//                     "small":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/small_MK_KG_656b684faf_38207250c3.jpg"
//                  }
//               },
//               "icon":{
//                  "size_formatted":"16.83 KB",
//                  "url":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/logo_MIKA_83f14601a0_74a120471a.png",
//                  "formats":{
//                     "thumbnail":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/thumbnail_logo_MIKA_83f14601a0_74a120471a.png",
//                     "large":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/logo_MIKA_83f14601a0_74a120471a.png",
//                     "medium":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/medium_logo_MIKA_83f14601a0_74a120471a.png",
//                     "small":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/small_logo_MIKA_83f14601a0_74a120471a.png"
//                  }
//               }
//            }
//         ],
//         "about_preview":"&nbsp;dr. Dennis William Pratama,Sp.B adalah&nbsp;Dokter&nbsp;Spesialis Bedah&nbsp;yang&nbsp;telah&nbsp;menyelesaikan&nbsp;pendidikan&nbsp;di Universitas Indonesia. Beliau dapat memberikan&nbsp;pelayanan&nbsp;medis&nbsp;/&nbsp;konsultasi&nbsp;terkait&nbsp;kondisi penyakit bedah.&nbsp;"
//      },
//      {
//         "doctor_id":"60c9fd6dcb0e2e001240840d",
//         "name":"dr. Aron Husink,Sp.JP",
//         "slug":"dr.-aron-husinksp.jp",
//         "is_popular":true,
//         "about":"<p><span style=\"background-color:rgb(255,255,255);color:rgb(0,0,0);\">&nbsp;dr. Aron Husink,Sp.JP adalah&nbsp;Dokter&nbsp;Spesialis Penyakit Jantung dan Pembuluh Darah&nbsp;yang&nbsp;telah&nbsp;menyelesaikan&nbsp;pendidikan&nbsp;di Universitas Indonesia. Beliau dapat memberikan&nbsp;pelayanan&nbsp;medis&nbsp;/&nbsp;konsultasi&nbsp;terkait&nbsp;kondisi penyakit jantung dan pembuluh darah.&nbsp;</span></p>",
//         "overview":"Dokter Spesialis Jantung & Pem. Darah",
//         "photo":{
//            "size_formatted":"154.64 KB",
//            "url":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/dr_Aron_Husink_sp_JP_K_FIHA_02071fb7ca.png",
//            "formats":{
//               "thumbnail":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/thumbnail_dr_Aron_Husink_sp_JP_K_FIHA_02071fb7ca.png",
//               "large":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/large_dr_Aron_Husink_sp_JP_K_FIHA_02071fb7ca.png",
//               "medium":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/medium_dr_Aron_Husink_sp_JP_K_FIHA_02071fb7ca.png",
//               "small":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/small_dr_Aron_Husink_sp_JP_K_FIHA_02071fb7ca.png"
//            }
//         },
//         "sip":"446.3/2152/03-DPMPTSP/OL/2020",
//         "experience":"6 Tahun Pengalaman",
//         "price":{
//            "raw":200000,
//            "formatted":"Rp 200.000"
//         },
//         "specialization":{
//            "id":"607d05dd3925ca001231faf5",
//            "name":"Jantung & Pem.Darah"
//         },
//         "hospital":[
//            {
//               "id":"60c9d8289b299d0012f4ee28",
//               "name":"Mitra Keluarga Bintaro",
//               "image":{
//                  "size_formatted":"767.88 KB",
//                  "url":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/MK_KG_656b684faf_38207250c3.jpg",
//                  "formats":{
//                     "thumbnail":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/thumbnail_MK_KG_656b684faf_38207250c3.jpg",
//                     "large":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/large_MK_KG_656b684faf_38207250c3.jpg",
//                     "medium":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/medium_MK_KG_656b684faf_38207250c3.jpg",
//                     "small":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/small_MK_KG_656b684faf_38207250c3.jpg"
//                  }
//               },
//               "icon":{
//                  "size_formatted":"16.83 KB",
//                  "url":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/logo_MIKA_83f14601a0_74a120471a.png",
//                  "formats":{
//                     "thumbnail":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/thumbnail_logo_MIKA_83f14601a0_74a120471a.png",
//                     "large":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/logo_MIKA_83f14601a0_74a120471a.png",
//                     "medium":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/medium_logo_MIKA_83f14601a0_74a120471a.png",
//                     "small":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/small_logo_MIKA_83f14601a0_74a120471a.png"
//                  }
//               }
//            }
//         ],
//         "about_preview":"&nbsp;dr. Aron Husink,Sp.JP adalah&nbsp;Dokter&nbsp;Spesialis Penyakit Jantung dan Pembuluh Darah&nbsp;yang&nbsp;telah&nbsp;menyelesaikan&nbsp;pendidikan&nbsp;di Universitas Indonesia. Beliau dapat memberikan&nbsp;pelayanan&nbsp;medis&nbsp;/&nbsp;konsultasi&nbsp;terkait&nbsp;kondisi penyakit"
//      },
//      {
//         "doctor_id":"60c9fd9aa3325900127b77dd",
//         "name":"dr. Bunga Sejuk Segar,Sp.KK",
//         "slug":"dr.-bunga-sejuk-segarsp.kk",
//         "is_popular":true,
//         "about":"<p><span style=\"background-color:rgb(255,255,255);color:rgb(0,0,0);\">&nbsp;dr. Bunga Sejuk Segar,Sp.KK adalah&nbsp;Dokter&nbsp;Spesialis Kulit dan Kelamin&nbsp;yang&nbsp;telah&nbsp;menyelesaikan&nbsp;pendidikan&nbsp;di Universitas Gadjah Mada. Beliau dapat memberikan&nbsp;pelayanan&nbsp;medis&nbsp;/&nbsp;konsultasi&nbsp;terkait&nbsp;kondisi penyakit kulit dan kelamin.&nbsp;</span></p>",
//         "overview":"Dokter Spesialis Kulit & Kelamin",
//         "photo":{
//            "size_formatted":"146.21 KB",
//            "url":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/dr_Bunga_Sp_KK_7794b732a9.png",
//            "formats":{
//               "thumbnail":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/thumbnail_dr_Bunga_Sp_KK_7794b732a9.png",
//               "large":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/large_dr_Bunga_Sp_KK_7794b732a9.png",
//               "medium":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/medium_dr_Bunga_Sp_KK_7794b732a9.png",
//               "small":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/small_dr_Bunga_Sp_KK_7794b732a9.png"
//            }
//         },
//         "sip":"446.3/0724/03-DPMPTSP/OL/2019",
//         "experience":"4 Tahun Pengalaman",
//         "price":{
//            "raw":200000,
//            "formatted":"Rp 200.000"
//         },
//         "specialization":{
//            "id":"608f6c099223090012ef276a",
//            "name":"Kulit & Kelamin"
//         },
//         "hospital":[
//            {
//               "id":"60c9d8289b299d0012f4ee28",
//               "name":"Mitra Keluarga Bintaro",
//               "image":{
//                  "size_formatted":"767.88 KB",
//                  "url":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/MK_KG_656b684faf_38207250c3.jpg",
//                  "formats":{
//                     "thumbnail":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/thumbnail_MK_KG_656b684faf_38207250c3.jpg",
//                     "large":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/large_MK_KG_656b684faf_38207250c3.jpg",
//                     "medium":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/medium_MK_KG_656b684faf_38207250c3.jpg",
//                     "small":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/small_MK_KG_656b684faf_38207250c3.jpg"
//                  }
//               },
//               "icon":{
//                  "size_formatted":"16.83 KB",
//                  "url":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/logo_MIKA_83f14601a0_74a120471a.png",
//                  "formats":{
//                     "thumbnail":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/thumbnail_logo_MIKA_83f14601a0_74a120471a.png",
//                     "large":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/logo_MIKA_83f14601a0_74a120471a.png",
//                     "medium":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/medium_logo_MIKA_83f14601a0_74a120471a.png",
//                     "small":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/small_logo_MIKA_83f14601a0_74a120471a.png"
//                  }
//               }
//            }
//         ],
//         "about_preview":"&nbsp;dr. Bunga Sejuk Segar,Sp.KK adalah&nbsp;Dokter&nbsp;Spesialis Kulit dan Kelamin&nbsp;yang&nbsp;telah&nbsp;menyelesaikan&nbsp;pendidikan&nbsp;di Universitas Gadjah Mada. Beliau dapat memberikan&nbsp;pelayanan&nbsp;medis&nbsp;/&nbsp;konsultasi&nbsp;terkait&nbsp;kondisi penyakit"
//      },
//      {
//         "doctor_id":"60e95838e6ffe8001217113c",
//         "name":"dr. Christin Wigin, Sp.OG",
//         "slug":"dr.-christin-wigin-sp.og",
//         "is_popular":true,
//         "about":"<p>dr. Christin Wigin, Sp.OG adalah seorang Dokter Spesialis Kebidananan dan Kandungan yang telah menyelesaikan&nbsp;pendidikan&nbsp;di Universitas Indonesia. Beliau dapat memberikan&nbsp;pelayanan&nbsp;medis&nbsp;/&nbsp;konsultasi&nbsp;terkait&nbsp;kondisi penyakit kebidanan dan kandungan.</p>",
//         "overview":"Dokter Spesialis Kebidanan dan Kandungan",
//         "photo":{
//            "size_formatted":"775.74 KB",
//            "url":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/49_dr_Christin_Wigin_Sp_OG_3df6354262.png",
//            "formats":{
//               "thumbnail":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/thumbnail_49_dr_Christin_Wigin_Sp_OG_3df6354262.png",
//               "large":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/49_dr_Christin_Wigin_Sp_OG_3df6354262.png",
//               "medium":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/medium_49_dr_Christin_Wigin_Sp_OG_3df6354262.png",
//               "small":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/small_49_dr_Christin_Wigin_Sp_OG_3df6354262.png"
//            }
//         },
//         "sip":"446.6/929/SP/II/4952-DinKes/2018",
//         "experience":"5 Tahun Pengalaman",
//         "price":{
//            "raw":150000,
//            "formatted":"Rp 150.000"
//         },
//         "specialization":{
//            "id":"607d06b63925ca001231faf9",
//            "name":"Kebidanan & Kandungan"
//         },
//         "hospital":[
//            {
//               "id":"60dcf905debf19001219a3cb",
//               "name":"Mitra Keluarga Gading Serpong",
//               "image":{
//                  "size_formatted":"767.88 KB",
//                  "url":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/MK_KG_656b684faf_38207250c3.jpg",
//                  "formats":{
//                     "thumbnail":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/thumbnail_MK_KG_656b684faf_38207250c3.jpg",
//                     "large":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/large_MK_KG_656b684faf_38207250c3.jpg",
//                     "medium":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/medium_MK_KG_656b684faf_38207250c3.jpg",
//                     "small":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/small_MK_KG_656b684faf_38207250c3.jpg"
//                  }
//               },
//               "icon":{
//                  "size_formatted":"16.83 KB",
//                  "url":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/logo_MIKA_83f14601a0_74a120471a.png",
//                  "formats":{
//                     "thumbnail":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/thumbnail_logo_MIKA_83f14601a0_74a120471a.png",
//                     "large":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/logo_MIKA_83f14601a0_74a120471a.png",
//                     "medium":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/medium_logo_MIKA_83f14601a0_74a120471a.png",
//                     "small":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/small_logo_MIKA_83f14601a0_74a120471a.png"
//                  }
//               }
//            }
//         ],
//         "about_preview":"dr. Christin Wigin, Sp.OG adalah seorang Dokter Spesialis Kebidananan dan Kandungan yang telah menyelesaikan&nbsp;pendidikan&nbsp;di Universitas"
//      },
//      {
//         "doctor_id":"60e95838e6ffe80012171140",
//         "name":"dr. Jimmy Panji Wirawan, Sp.OG",
//         "slug":"dr.-jimmy-panji-wirawan-sp.og",
//         "is_popular":true,
//         "about":"<p>dr. Jimmy Panji Wirawan, Sp.OG adalah seorang Dokter Spesialis Kebidananan dan Kandungan yang telah menyelesaikan&nbsp;pendidikan&nbsp;di Universitas Indonesia. Beliau dapat memberikan&nbsp;pelayanan&nbsp;medis&nbsp;/&nbsp;konsultasi&nbsp;terkait&nbsp;kondisi penyakit kebidanan dan kandungan.</p>",
//         "overview":"Dokter Spesialis Kebidanan dan Kandungan",
//         "photo":{
//            "size_formatted":"1.02 MB",
//            "url":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/54_dr_Jimmy_Panji_Wirawan_Sp_OG_8d7b12e405.png",
//            "formats":{
//               "thumbnail":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/thumbnail_54_dr_Jimmy_Panji_Wirawan_Sp_OG_8d7b12e405.png",
//               "large":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/54_dr_Jimmy_Panji_Wirawan_Sp_OG_8d7b12e405.png",
//               "medium":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/medium_54_dr_Jimmy_Panji_Wirawan_Sp_OG_8d7b12e405.png",
//               "small":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/small_54_dr_Jimmy_Panji_Wirawan_Sp_OG_8d7b12e405.png"
//            }
//         },
//         "sip":"446.6/1162/SP/II/5533-DinKes/2018",
//         "experience":"9 Tahun Pengalaman",
//         "price":{
//            "raw":150000,
//            "formatted":"Rp 150.000"
//         },
//         "specialization":{
//            "id":"607d06b63925ca001231faf9",
//            "name":"Kebidanan & Kandungan"
//         },
//         "hospital":[
//            {
//               "id":"60dcf905debf19001219a3cb",
//               "name":"Mitra Keluarga Gading Serpong",
//               "image":{
//                  "size_formatted":"767.88 KB",
//                  "url":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/MK_KG_656b684faf_38207250c3.jpg",
//                  "formats":{
//                     "thumbnail":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/thumbnail_MK_KG_656b684faf_38207250c3.jpg",
//                     "large":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/large_MK_KG_656b684faf_38207250c3.jpg",
//                     "medium":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/medium_MK_KG_656b684faf_38207250c3.jpg",
//                     "small":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/small_MK_KG_656b684faf_38207250c3.jpg"
//                  }
//               },
//               "icon":{
//                  "size_formatted":"16.83 KB",
//                  "url":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/logo_MIKA_83f14601a0_74a120471a.png",
//                  "formats":{
//                     "thumbnail":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/thumbnail_logo_MIKA_83f14601a0_74a120471a.png",
//                     "large":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/logo_MIKA_83f14601a0_74a120471a.png",
//                     "medium":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/medium_logo_MIKA_83f14601a0_74a120471a.png",
//                     "small":"https://cms-bucket-alteacare.s3.ap-southeast-1.amazonaws.com/small_logo_MIKA_83f14601a0_74a120471a.png"
//                  }
//               }
//            }
//         ],
//         "about_preview":"dr. Jimmy Panji Wirawan, Sp.OG adalah seorang Dokter Spesialis Kebidananan dan Kandungan yang telah menyelesaikan&nbsp;pendidikan&nbsp;di"
//      }
//   ]
//}
