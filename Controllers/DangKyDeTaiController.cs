using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DoAnKhoaCNTT.Models.Database;
using DoAnKhoaCNTT.Models;
using DoAnKhoaCNTT.Dao;
using DoAnKhoaCNTT.Models.DangKyDeTai;

namespace DoAnKhoaCNTT.Controllers
{
    public class DangKyDeTaiController : Controller
    {
        // GET: DangKyDeTai
        private KhoaCNTT db = new KhoaCNTT();
        [HttpGet]
        public ActionResult DangKyDeTaiDoAn(string maDT)
        {
            return View(db.DeTais.FirstOrDefault(sp => sp.MaDeTai == maDT));
        }
        public ActionResult DangKyDoAn(string maDoAn)
        {
            return View(db.DeTais.FirstOrDefault(sp => sp.MaDeTai == maDoAn));
        }
        protected void SetAlert(string message, string type)
        {
            TempData["AlertMessage"] = message;
            if (type == "success")
            {
                TempData["AlertType"] = "alert-success";
            }
            else if (type == "warning")
            {
                TempData["AlertType"] = "alert-warning";
            }
            else if (type == "error")
            {
                TempData["AlertType"] = "alert-danger";
            }
        }
        [HttpPost]
        public ActionResult DangKyDeTaiDoAn(FormCollection coll)
        {

            var dao = new CheckThongTinDao();
            var maUser = coll["MaUser"];
            var tenUser = coll["TenUser"];
            var maNhom = coll["MaNhom"];
            var maDeTai = coll["MaDeTai"];
            var tenDeTai = coll["TenDeTai"];
            var tenLoaiDT = coll["TenLoaiDeTai"];
            var deTaiKhoa = coll["KhoaDeTai"];
            var maGVHD = coll["TenGVHD"];
            int checkuser = int.Parse(maUser);
            long checkmanhom = long.Parse(maNhom);
            var user = db.NhomSVChinhs.Count(x => x.MaSv2 == checkuser && x.ChucVuSv2 == "Thành viên") > 0;            
            var member = db.DanhSachDeTaiDaDangKies.Count(x => x.MaNhom == checkmanhom) > 0;
            var nhom = db.NhomSVChinhs.Count(x => x.MaSv1 == checkuser && x.MaLoaiNhom == 1) < 1;
            if (user)
            {
                SetAlert("Bạn không phải nhóm trưởng nên không được đăng ký", "error");
                RedirectToAction("DanhMucNhomChuyenNganh", "NoiDung");
            }
            else if (nhom)
            {
                SetAlert("Bạn chưa đăng ký nhóm", "error");
            }
            else if (member)
            {
                SetAlert("Nhóm của bạn đã đăng kí đồ án chuyên ngành rồi", "error");
                RedirectToAction("DanhMucNhomChuyenNganh", "NoiDung");
            }
            else
            {
                DanhSachDeTaiDaDangKy s = new DanhSachDeTaiDaDangKy();
                s.MaDeTaiDaDangKi = int.Parse(maUser);
                s.MaSV1 = int.Parse(maUser);
                s.TenSV1 = tenUser;
                s.MaDeTai = maDeTai;
                s.TenDeTai = tenDeTai;
                s.TenLoaiDeTai = tenLoaiDT;
                s.MaNhom = int.Parse(maNhom);
                s.MaGVHD = maGVHD;
                s.MaKhoa = deTaiKhoa;             
                s.ChucVu = "Trưởng nhóm";
                var detai = dao.InsertDeTai(s);
                RedirectToAction("DanhSachNhomChuyenNganh", "NoiDung");
                if (detai > 0)
                {
                    SetAlert("Đăng ký đề tài đồ án chuyên ngành thành công", "success");
                }
                else
                {
                    SetAlert("Đăng ký không thành công", "success");
                }
            }
            return RedirectToAction("DangKyDeTaiChuyenNganh", "NoiDung");
        }
        [HttpGet]
        public ActionResult DangKyDeTaiDoAnTotNghiep(string maDT)
        {
            return View(db.DeTais.FirstOrDefault(sp => sp.MaDeTai == maDT));
        }
        [HttpPost]
        public ActionResult DangKyDeTaiDoAnTotNghiep(FormCollection coll)
        {

            var dao = new CheckThongTinDao();
            var maUser = coll["MaUser"];
            var tenUser = coll["TenUser"];
            var maNhom = coll["MaNhom"];
            var maDeTai = coll["MaDeTai"];
            var tenDeTai = coll["TenDeTai"];
            var tenLoaiDT = coll["TenLoaiDeTai"];
            var deTaiKhoa = coll["KhoaDeTai"];
            var maGVHD = coll["TenGVHD"];
            int checkuser = int.Parse(maUser);
            long checkmanhom = long.Parse(maNhom);
            var user = db.NhomSVChinhs.Count(x => x.MaSv2 == checkuser && x.ChucVuSv2 == "Thành viên") > 0;
            var member = db.DanhSachDeTaiDaDangKies.Count(x => x.MaNhom == checkmanhom) > 0;
            var nhom = db.NhomSVChinhs.Count(x => x.MaSv1 == checkuser && x.MaLoaiNhom == 2) < 1;
            if (user)
            {
                SetAlert("Bạn không phải nhóm trưởng nên không được đăng ký", "error");
                RedirectToAction("DanhMucNhomChuyenNganh", "NoiDung");
            }
            else if (nhom)
            {
                SetAlert("Bạn chưa đăng ký nhóm", "error");
            }
            else if (member)
            {
                SetAlert("Nhóm của bạn đã đăng kí đồ án tốt nghiệp rồi", "error");
                RedirectToAction("DanhMucNhomChuyenNganh", "NoiDung");
            }
            else
            {
                DanhSachDeTaiDaDangKy s = new DanhSachDeTaiDaDangKy();
                s.MaDeTaiDaDangKi = long.Parse(maNhom);
                s.MaSV1 = int.Parse(maUser);
                s.TenSV1 = tenUser;
                s.MaDeTai = maDeTai;
                s.TenDeTai = tenDeTai;
                s.TenLoaiDeTai = tenLoaiDT;
                s.MaNhom = long.Parse(maNhom);
                s.MaGVHD = maGVHD;
                s.MaKhoa = deTaiKhoa;
                s.ChucVu = "Trưởng nhóm";
                var detai = dao.InsertDeTai(s);
                RedirectToAction("DanhSachNhomChuyenNganh", "NoiDung");
                if (detai > 0)
                {
                    SetAlert("Đăng ký đề tài đồ án tốt nghiệp thành công", "success");
                }
                else
                {
                    SetAlert("Đăng ký không thành công", "success");
                }
            }
            return RedirectToAction("DangKyDeTaiTotNghiep", "NoiDung");
        }
        [HttpGet]
        public ActionResult DangKyDeTaiKhoaLuan(string maDT)
        {
            return View(db.DeTais.FirstOrDefault(sp => sp.MaDeTai == maDT));
        }
        [HttpPost]
        public ActionResult DangKyDeTaiKhoaLuan(FormCollection coll)
        {

            var dao = new CheckThongTinDao();
            var maUser = coll["MaUser"];
            var tenUser = coll["TenUser"];
            var maNhom = coll["MaNhom"];
            var maDeTai = coll["MaDeTai"];
            var tenDeTai = coll["TenDeTai"];
            var tenLoaiDT = coll["TenLoaiDeTai"];
            var deTaiKhoa = coll["KhoaDeTai"];
            var maGVHD = coll["TenGVHD"];
            int checkuser = int.Parse(maUser);
            long checkmanhom = long.Parse(maNhom);
            var user = db.NhomSVChinhs.Count(x => x.MaSv2 == checkuser && x.ChucVuSv2 == "Thành viên") > 0;
            var member = db.DanhSachDeTaiDaDangKies.Count(x => x.MaNhom == checkmanhom) > 0;
            var nhom = db.NhomSVChinhs.Count(x => x.MaSv1 == checkuser && x.MaLoaiNhom == 3) < 1;
            if (user)
            {
                SetAlert("Bạn không phải nhóm trưởng nên không được đăng ký", "error");
                RedirectToAction("DanhMucNhomKhoaLuan", "NoiDung");
            }
            else if (nhom)
            {
                SetAlert("Bạn chưa đăng ký nhóm", "error");
            }
            else if (member)
            {
                SetAlert("Nhóm của bạn đã đăng kí khóa luận rồi", "error");
                RedirectToAction("DanhMucNhomKhoaLuan", "NoiDung");
            }
            else
            {
                DanhSachDeTaiDaDangKy s = new DanhSachDeTaiDaDangKy();
                s.MaDeTaiDaDangKi = int.Parse(maUser);
                s.MaSV1 = int.Parse(maUser);
                s.TenSV1 = tenUser;
                s.MaDeTai = maDeTai;
                s.TenDeTai = tenDeTai;
                s.TenLoaiDeTai = tenLoaiDT;
                s.MaNhom = long.Parse(maNhom);
                s.MaGVHD = maGVHD;
                s.MaKhoa = deTaiKhoa;
                s.ChucVu = "Trưởng nhóm";
                var detai = dao.InsertDeTai(s);
                RedirectToAction("DanhSachNhomKhoaLuan", "NoiDung");
                if (detai > 0)
                {
                    SetAlert("Đăng ký đề tài khóa luận thành công", "success");
                }
                else
                {
                    SetAlert("Đăng ký không thành công", "success");
                }
            }
            return RedirectToAction("DangKyDeTaiKhoaLuan", "NoiDung");
        }
    }
}