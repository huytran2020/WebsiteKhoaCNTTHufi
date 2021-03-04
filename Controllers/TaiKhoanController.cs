using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DoAnKhoaCNTT.Models.Database;
namespace DoAnKhoaCNTT.Controllers
{
    public class TaiKhoanController : Controller
    {
        // GET: TaiKhoan
        KhoaCNTT db = new KhoaCNTT();
        public ActionResult DangNhap()
        {
            return View();
        }
        [HttpPost]
        public ActionResult DangNhap(int TenDN, string MatKhau)
        {          
            var sinhVien = db.SinhViens.FirstOrDefault(sv => sv.MaSinhVien == TenDN && sv.Password == MatKhau);
            var nhomcho = db.NhomSVs.FirstOrDefault(sv => sv.MaSV1 == TenDN || sv.MaSV2 == TenDN);
            var nhomchotn = db.NhomSVs.FirstOrDefault(sv => sv.MaSV1 == TenDN && sv.MaLoaiNhom == 2 || sv.MaSV2 == TenDN && sv.MaLoaiNhom == 2);
            var nhomchoKL = db.NhomSVs.FirstOrDefault(sv => sv.MaSV1 == TenDN && sv.MaLoaiNhom == 3 || sv.MaSV2 == TenDN && sv.MaLoaiNhom == 3);
            var nhomsv = db.NhomSVChinhs.FirstOrDefault(sv => sv.MaSv1 == TenDN || sv.MaSv2 == TenDN);
            var nhom = new NhomSV();
            var nhomda = db.NhomSVChinhs.Count(x => x.MaSv1 == TenDN && x.MaLoaiNhom == 1 || x.MaSv2 == TenDN && x.MaLoaiNhom == 1) > 0;
            var nhomdatn = db.NhomSVChinhs.Count(x => x.MaSv1 == TenDN && x.MaLoaiNhom == 2 || x.MaSv2 == TenDN && x.MaLoaiNhom == 2) > 0;
            var nhomkl = db.NhomSVChinhs.Count(x => x.MaSv1 == TenDN && x.MaLoaiNhom == 3 || x.MaSv2 == TenDN && x.MaLoaiNhom == 3) > 0;

            var nhomdanull = db.NhomSVChinhs.Count(x => x.MaSv1 == TenDN && x.MaLoaiNhom == 1 || x.MaSv2 == TenDN && x.MaLoaiNhom == 1) < 1;
            var nhomdatnnull = db.NhomSVChinhs.Count(x => x.MaSv1 == TenDN && x.MaLoaiNhom == 2 || x.MaSv2 == TenDN && x.MaLoaiNhom == 2) < 1;
            var nhomklnull = db.NhomSVChinhs.Count(x => x.MaSv1 == TenDN && x.MaLoaiNhom == 3 || x.MaSv2 == TenDN && x.MaLoaiNhom == 3) < 1;

            var nhomchoda = db.NhomSVs.Count(x => x.MaSV1 == TenDN && x.MaLoaiNhom == 1 || x.MaSV2 == TenDN && x.MaLoaiNhom == 1) > 0;
            var nhomchodatn = db.NhomSVs.Count(x => x.MaSV1 == TenDN && x.MaLoaiNhom == 2 || x.MaSV2 == TenDN && x.MaLoaiNhom == 2) > 0;
            var nhomchokl = db.NhomSVs.Count(x => x.MaSV1 == TenDN && x.MaLoaiNhom == 3 || x.MaSV2 == TenDN && x.MaLoaiNhom == 3) > 0;
            
            if (sinhVien != null)
            {
                if (nhomcho != null)
                {
                    if (nhomdanull && nhomchoda)
                    {
                        Session["Name"] = sinhVien.Name;
                        Session["MaSinhVien"] = sinhVien.MaSinhVien;
                        Session["MaKhoa"] = sinhVien.MaKhoa;
                        Session["MaLoaiDeTai"] = sinhVien.MaLoaiDeTai;
                        Session["MaNhom"] = nhomcho.MaNhom;
                        Session["TenLoaiDeTai"] = nhomcho.TenLoaiDeTai;
                        Session["MaKhoaSV1"] = nhomcho.MaKhoaSV1;
                        Session["MaSV1"] = nhomcho.MaSV1;
                        Session["TenSV1"] = nhomcho.TenSV1;
                        Session["ChucVuSV1"] = nhomcho.ChucVuSV1;
                        Session["MaSV2"] = nhomcho.MaSV2;
                        Session["TenSV2"] = nhomcho.TenSV2;
                        Session["ChucVuSV2"] = nhomcho.ChucVuSV2;
                        Session["MaLoaiNhom"] = nhomcho.MaLoaiNhom;
                        Session["MaKhoaSV2"] = nhomcho.MaKhoaSV2;
                        return RedirectToAction("DanhMucNhomChoCN", "NoiDung");
                    }
                    else if (nhomdatnnull && nhomchodatn)
                    {
                        Session["Name"] = sinhVien.Name;
                        Session["MaSinhVien"] = sinhVien.MaSinhVien;
                        Session["MaKhoa"] = sinhVien.MaKhoa;
                        Session["MaLoaiDeTai"] = sinhVien.MaLoaiDeTai;
                        Session["MaNhomTN"] = nhomchotn.MaNhom;
                        Session["TenLoaiDeTaiTN"] = nhomchotn.TenLoaiDeTai;
                        Session["MaKhoaSV1TN"] = nhomchotn.MaKhoaSV1;
                        Session["MaSV1TN"] = nhomchotn.MaSV1;
                        Session["TenSV1TN"] = nhomchotn.TenSV1;
                        Session["ChucVuSV1TN"] = nhomchotn.ChucVuSV1;
                        Session["MaSV2TN"] = nhomchotn.MaSV2;
                        Session["TenSV2TN"] = nhomchotn.TenSV2;
                        Session["ChucVuSV2TN"] = nhomchotn.ChucVuSV2;
                        Session["MaLoaiNhomTN"] = nhomchotn.MaLoaiNhom;
                        Session["MaKhoaSV2TN"] = nhomchotn.MaKhoaSV2;
                        return RedirectToAction("DanhMucNhomChoTN", "NoiDung");
                    }
                    else if (nhomklnull && nhomchokl)
                    {
                        Session["Name"] = sinhVien.Name;
                        Session["MaSinhVien"] = sinhVien.MaSinhVien;
                        Session["MaKhoa"] = sinhVien.MaKhoa;
                        Session["MaLoaiDeTai"] = sinhVien.MaLoaiDeTai;
                        Session["MaNhom"] = nhomchoKL.MaNhom;
                        Session["TenLoaiDeTai"] = nhomchoKL.TenLoaiDeTai;
                        Session["MaKhoaSV1"] = nhomchoKL.MaKhoaSV1;
                        Session["MaSV1"] = nhomchoKL.MaSV1;
                        Session["TenSV1"] = nhomchoKL.TenSV1;
                        Session["ChucVuSV1"] = nhomchoKL.ChucVuSV1;
                        Session["MaSV2"] = nhomchoKL.MaSV2;
                        Session["TenSV2"] = nhomchoKL.TenSV2;
                        Session["ChucVuSV2"] = nhomchoKL.ChucVuSV2;
                        Session["MaLoaiNhom"] = nhomchoKL.MaLoaiNhom;
                        Session["MaKhoaSV2"] = nhomchoKL.MaKhoaSV2;
                        return RedirectToAction("DanhMucNhomChoKL", "NoiDung");
                    }
                    else if (nhomda && nhomdatn)
                    {
                        Session["Name"] = sinhVien.Name;
                        Session["MaSinhVien"] = sinhVien.MaSinhVien;
                        Session["MaKhoa"] = sinhVien.MaKhoa;
                        Session["MaLoaiDeTai"] = sinhVien.MaLoaiDeTai;
                        return RedirectToAction("DanhMucNhomChuyenNganh", "NoiDung");
                    }
                    else if (nhomda && nhomchodatn)
                    {
                        Session["Name"] = sinhVien.Name;
                        Session["MaSinhVien"] = sinhVien.MaSinhVien;
                        Session["MaKhoa"] = sinhVien.MaKhoa;
                        Session["MaLoaiDeTai"] = sinhVien.MaLoaiDeTai;
                        Session["MaNhomTN"] = nhomchotn.MaNhom;
                        Session["TenLoaiDeTaiTN"] = nhomchotn.TenLoaiDeTai;
                        Session["MaKhoaSV1TN"] = nhomchotn.MaKhoaSV1;
                        Session["MaSV1TN"] = nhomchotn.MaSV1;
                        Session["TenSV1TN"] = nhomchotn.TenSV1;
                        Session["ChucVuSV1TN"] = nhomchotn.ChucVuSV1;
                        Session["MaSV2TN"] = nhomchotn.MaSV2;
                        Session["TenSV2TN"] = nhomchotn.TenSV2;
                        Session["ChucVuSV2TN"] = nhomchotn.ChucVuSV2;
                        Session["MaLoaiNhomTN"] = nhomchotn.MaLoaiNhom;
                        Session["MaKhoaSV2TN"] = nhomchotn.MaKhoaSV2;
                        return RedirectToAction("DanhMucNhomChoTN", "NoiDung");


                    }
                    else if (nhomdatn && nhomchoda)
                    {
                        Session["Name"] = sinhVien.Name;
                        Session["MaSinhVien"] = sinhVien.MaSinhVien;
                        Session["MaKhoa"] = sinhVien.MaKhoa;
                        Session["MaLoaiDeTai"] = sinhVien.MaLoaiDeTai;
                        Session["MaNhom"] = nhomcho.MaNhom;
                        Session["TenLoaiDeTai"] = nhomcho.TenLoaiDeTai;
                        Session["MaKhoaSV1"] = nhomcho.MaKhoaSV1;
                        Session["MaSV1"] = nhomcho.MaSV1;
                        Session["TenSV1"] = nhomcho.TenSV1;
                        Session["ChucVuSV1"] = nhomcho.ChucVuSV1;
                        Session["MaSV2"] = nhomcho.MaSV2;
                        Session["TenSV2"] = nhomcho.TenSV2;
                        Session["ChucVuSV2"] = nhomcho.ChucVuSV2;
                        Session["MaLoaiNhom"] = nhomcho.MaLoaiNhom;
                        Session["MaKhoaSV2"] = nhomcho.MaKhoaSV2;
                        return RedirectToAction("DanhMucNhomChoCN", "NoiDung");
                    }
                    else if (nhomda)
                    {
                        Session["Name"] = sinhVien.Name;
                        Session["MaSinhVien"] = sinhVien.MaSinhVien;
                        Session["MaKhoa"] = sinhVien.MaKhoa;
                        Session["MaLoaiDeTai"] = sinhVien.MaLoaiDeTai;
                        return RedirectToAction("DanhMucNhomChuyenNganh", "NoiDung");
                    }
                    else if (nhomdatn)
                    {
                        Session["Name"] = sinhVien.Name;
                        Session["MaSinhVien"] = sinhVien.MaSinhVien;
                        Session["MaKhoa"] = sinhVien.MaKhoa;
                        Session["MaLoaiDeTai"] = sinhVien.MaLoaiDeTai;
                        return RedirectToAction("DanhMucNhomTotNghiep", "NoiDung");
                    }    
                    else if (nhomkl)
                    {
                        Session["Name"] = sinhVien.Name;
                        Session["MaSinhVien"] = sinhVien.MaSinhVien;
                        Session["MaKhoa"] = sinhVien.MaKhoa;
                        Session["MaLoaiDeTai"] = sinhVien.MaLoaiDeTai;
                        return RedirectToAction("DanhMucNhomKhoaLuan", "NoiDung");
                    }
                    return RedirectToAction("Index", "Home");
                }                                       
                else if (sinhVien.Mark >= 2 && sinhVien.Mark < 2.5)
                {
                    Session["Name"] = sinhVien.Name;
                    Session["MaSinhVien"] = sinhVien.MaSinhVien;
                    Session["MaKhoa"] = sinhVien.MaKhoa;
                    Session["MaLoaiDeTai"] = sinhVien.MaLoaiDeTai;
                    return RedirectToAction("DanhMucDoAnChuyenNganh", "NoiDung");
                }
                else if (sinhVien.Mark >= 2.5)
                {
                    Session["Name"] = sinhVien.Name;
                    Session["MaSinhVien"] = sinhVien.MaSinhVien;
                    Session["MaKhoa"] = sinhVien.MaKhoa;
                    Session["MaLoaiDeTai"] = sinhVien.MaLoaiDeTai;
                    return RedirectToAction("DanhMucKhoaLuan", "NoiDung");
                }
                else
                {
                    return RedirectToAction("Index", "Home");
                }
            }
            else
            {    
                return View("DangNhap");
            }
            
        }
        public ActionResult DangXuat()
        {
            Session["Name"] = null;
            Session["MaSinhVien"] = null;
            return RedirectToAction("Index", "Home");
        }
    }
}
//var sinhVien = db.SinhViens.FirstOrDefault(sv => sv.MaSinhVien == TenDN && sv.Password == MatKhau);
//var nhom = new NhomSV();
//var nhomda = db.NhomSVs.Count(x => x.MaSV1 == TenDN && x.MaLoaiNhom == 1 || x.MaSV2 == TenDN && x.MaLoaiNhom == 1) > 0;
//var nhomdatn = db.NhomSVs.Count(x => x.MaSV1 == TenDN && x.MaLoaiNhom == 2 || x.MaSV2 == TenDN && x.MaLoaiNhom == 2) > 0;
//var nhomkl = db.NhomSVs.Count(x => x.MaSV1 == TenDN && x.MaLoaiNhom == 3 || x.MaSV2 == TenDN && x.MaLoaiNhom == 3) > 0;
//var nhomloaikl = db.NhomSVs.Count(x => x.TenLoaiDeTai == "Khóa luận") > 0;
//if (sinhVien != null)
//{
//    if (nhomda)
//    {
//        Session["Name"] = sinhVien.Name;
//        Session["MaSinhVien"] = sinhVien.MaSinhVien;
//        Session["MaKhoa"] = sinhVien.MaKhoa;
//        return RedirectToAction("DanhMucNhomChuyenNganh", "NoiDung");
//    }
//    else if (nhomdatn)
//    {
//        Session["Name"] = sinhVien.Name;
//        Session["MaSinhVien"] = sinhVien.MaSinhVien;
//        Session["MaKhoa"] = sinhVien.MaKhoa;
//        return RedirectToAction("DanhMucNhomTotNghiep", "NoiDung");
//    }
//    else if (nhomkl)
//    {
//        Session["Name"] = sinhVien.Name;
//        Session["MaSinhVien"] = sinhVien.MaSinhVien;
//        Session["MaKhoa"] = sinhVien.MaKhoa;
//        return RedirectToAction("DanhMucNhomKhoaLuan", "NoiDung");
//    }
//    else if (sinhVien.Mark >= 2 && sinhVien.Mark < 2.5)
//    {
//        Session["Name"] = sinhVien.Name;
//        Session["MaSinhVien"] = sinhVien.MaSinhVien;
//        Session["MaKhoa"] = sinhVien.MaKhoa;
//        return RedirectToAction("DanhMucDoAnChuyenNganh", "NoiDung");
//    }
//    else if (sinhVien.Mark >= 2.5)
//    {
//        Session["Name"] = sinhVien.Name;
//        Session["MaSinhVien"] = sinhVien.MaSinhVien;
//        Session["MaKhoa"] = sinhVien.MaKhoa;
//        return RedirectToAction("DanhMucKhoaLuan", "NoiDung");
//    }
//    else
//    {
//        return RedirectToAction("Index", "Home");
//    }
//}
//else
//    return View("DangNhap");