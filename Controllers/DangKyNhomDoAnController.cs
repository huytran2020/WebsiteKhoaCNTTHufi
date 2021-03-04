using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DoAnKhoaCNTT.Dao;
using DoAnKhoaCNTT.Models.Database;
namespace DoAnKhoaCNTT.Controllers
{
    public class DangKyNhomDoAnController : Controller
    {
        // GET: DangKyNhomDoAn
        private KhoaCNTT db = new KhoaCNTT();
        [HttpGet]
        public ActionResult DangKyNhomDoAn(long maSV)
        {
             
            return View(db.SinhViens.FirstOrDefault(v => v.MaSinhVien == maSV));
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
        public ActionResult DangKyNhomDoAn(FormCollection coll)
        {
            
            var dao = new CheckThongTinDao();
            var maUser = coll["MaUser"];            
            var tenUser = coll["TenUser"];
            var maKhoaSV1 = coll["MaKhoaSV1"];
            var maMember = coll["MaMember"];
            var tenMember = coll["TenMember"];
            var maKhoaSV2 = coll["MaKhoaSV2"];
            int checkuser = int.Parse(maUser);
            int checkmember = int.Parse(maMember);
            var user = db.NhomSVs.Count(x => x.MaSV1 == checkuser && x.MaLoaiNhom == 1 || x.MaSV2 == checkuser && x.MaLoaiNhom == 1) > 0;           
            var member = db.NhomSVs.Count(x => x.MaSV2 == checkmember && x.MaLoaiNhom == 1 || x.MaSV1 == checkmember && x.MaLoaiNhom == 1) > 0;      
            NhomSV sv = new NhomSV();
            if(user)
            {
                SetAlert("Bạn đã đăng kí nhóm này rồi", "error");               
                RedirectToAction("DanhMucNhomChuyenNganh", "NoiDung");
            }
            else if (member)
            {
                SetAlert("Bạn của bạn đã đăng kí nhóm rồi", "error");
                RedirectToAction("DanhMucNhomChuyenNganh", "NoiDung");
            }
            else
            {
                sv.MaNhom = int.Parse(maUser);
                sv.TenLoaiDeTai = "Đồ án chuyên ngành";
                sv.MaKhoaSV1 = maKhoaSV1;
                sv.MaSV1 = int.Parse(maUser);
                sv.TenSV1 = tenUser;                
                sv.ChucVuSV1 = "Trưởng nhóm";
                sv.MaSV2 = int.Parse(maMember);
                sv.TenSV2 = tenMember;              
                sv.ChucVuSV2 = "Thành viên";
                sv.MaLoaiNhom = 1;
                sv.MaKhoaSV2 = maKhoaSV2;
                var nhom = dao.InsertNhom(sv);
                RedirectToAction("DanhSachNhomChuyenNganh", "NoiDung");               
                if (nhom > 0)
                {
                    SetAlert("Mời thành viên thành công! Chờ xác nhận nhóm từ thành viên", "success");                    
                }
                else
                {
                    SetAlert("Đăng ký không thành công", "success");                   
                }
            }           
            return RedirectToAction("DangKyNhomChuyenNganh", "NoiDung");
        }
        [HttpGet]
        public ActionResult DangKyNhomDoAnTotNghiep(long maSv)
        {

            return View(db.SinhViens.FirstOrDefault(v => v.MaSinhVien == maSv));
        }
        [HttpPost]
        public ActionResult DangKyNhomDoAnTotNghiep(FormCollection coll)
        {

            var dao = new CheckThongTinDao();
            var maUser = coll["MaUser"];
            var tenUser = coll["TenUser"];
            var maKhoaSV1 = coll["MaKhoaSV1"];
            var maMember = coll["MaMember"];
            var tenMember = coll["TenMember"];
            var maKhoaSV2 = coll["MaKhoaSV2"];
            int checkuser = int.Parse(maUser);
            int checkmember = int.Parse(maMember);
            var user = db.NhomSVs.Count(x => x.MaSV1 == checkuser && x.MaLoaiNhom == 2 || x.MaSV2 == checkuser && x.MaLoaiNhom == 2) > 0;
            var member = db.NhomSVs.Count(x => x.MaSV2 == checkmember && x.MaLoaiNhom == 2 || x.MaSV1 == checkmember && x.MaLoaiNhom == 2) > 0;
            var userChinh = db.NhomSVChinhs.Count(x => x.MaSv1 == checkuser && x.MaLoaiNhom == 2 || x.MaSv2 == checkuser && x.MaLoaiNhom == 2) > 0;
            var memberChinh = db.NhomSVChinhs.Count(x => x.MaSv2 == checkmember && x.MaLoaiNhom == 2 || x.MaSv1 == checkmember && x.MaLoaiNhom == 2) > 0;
            NhomSV sv = new NhomSV();
            if (user)
            {
                SetAlert("Bạn đã đăng kí nhóm này rồi", "error");
                RedirectToAction("DanhMucNhomTotNghiep", "NoiDung");
            }
            else if (member)
            {
                SetAlert("Bạn của bạn đã đăng kí nhóm rồi", "error");
                RedirectToAction("DanhMucNhomTotNghiep", "NoiDung");
            }
            else if (userChinh)
            {
                SetAlert("Bạn đã đăng kí nhóm này rồi", "error");
                RedirectToAction("DanhMucNhomTotNghiep", "NoiDung");
            }
            else if (memberChinh)
            {
                SetAlert("Bạn của bạn đã đăng kí nhóm rồi", "error");
                RedirectToAction("DanhMucNhomTotNghiep", "NoiDung");
            }
            else
            {
                var mot = "1";
                long manhom = long.Parse((maUser + mot).ToString());
                sv.MaNhom = manhom;
                sv.TenLoaiDeTai = "Đồ án tốt nghiệp";
                sv.MaKhoaSV1 = maKhoaSV1;
                sv.MaSV1 = int.Parse(maUser);
                sv.TenSV1 = tenUser;
                sv.ChucVuSV1 = "Trưởng nhóm";
                sv.MaSV2 = int.Parse(maMember);
                sv.TenSV2 = tenMember;
                sv.ChucVuSV2 = "Thành viên";
                sv.MaLoaiNhom = 2;
                sv.MaKhoaSV2 = maKhoaSV2;
                var nhom = dao.InsertNhom(sv);
                RedirectToAction("DanhMucNhomTotNghiep", "NoiDung");
                if (nhom > 0)
                {
                    SetAlert("Mời thành viên thành công! Chờ xác nhận nhóm từ thành viên", "success");
                }
                else
                {
                    SetAlert("Đăng ký không thành công", "success");
                }
            }
            return RedirectToAction("DangKyNhomTotNghiep", "NoiDung");
        }
        // xác nhận nhóm đồ án chuyên ngành
        [HttpGet]
        public ActionResult XacNhanNhomDoAnChuyenNganh()
        {
            return View();
        }
        [HttpPost]
        public ActionResult XacNhanNhomDoAnChuyenNganh(FormCollection coll)
        {
            var dao = new CheckThongTinDao();
            var maNhom = coll["MaNhom"];
            var maLoaiNhom = coll["MaLoaiNhom"];
            var tenLoaiDT = coll["TenLoaiDT"];
            var maUser = coll["MaUser"];
            var tenUser = coll["TenUser"];
            var maKhoaSV1 = coll["MaKhoaSV1"];
            var chucVuSv1 = coll["ChucVuSV1"];
            var maMember = coll["MaMember"];
            var tenMember = coll["TenMember"];
            var maKhoaSV2 = coll["MaKhoaSV2"];
            var chucVuSv2 = coll["ChucVuSV2"];
            var mauser = int.Parse(maUser);
            var mamember = int.Parse(maMember);
            var sesMaSV2 = Session["MaSV2"].ToString();
            var sesMaSV1 = int.Parse(Session["MaSV1"].ToString());
            var intMaSV2 = int.Parse(sesMaSV2);
            NhomSVChinh svcn = new NhomSVChinh();
            var checkmember = db.NhomSVs.Count(x => x.MaSV2 == intMaSV2) > 0;
            var checkuser = db.NhomSVs.Count(x => x.MaSV1 == sesMaSV1) > 0;          
            var user = db.NhomSVChinhs.Count(x => x.MaSv1 == mauser && x.MaLoaiNhom == 2 || x.MaSv2 == mamember && x.MaLoaiNhom == 2) > 0;
            if(checkmember)
            {
                svcn.MaNhom = int.Parse(maNhom);
                svcn.TenLoaiDeTai = tenLoaiDT;
                svcn.MaKhoaSv1 = maKhoaSV1;
                svcn.MaSv1 = int.Parse(maUser);
                svcn.TenSv1 = tenUser;
                svcn.ChucVuSv1 = chucVuSv1;
                svcn.MaSv2 = int.Parse(maMember);
                svcn.TenSv2 = tenMember;
                svcn.ChucVuSv2 = chucVuSv2;
                svcn.MaLoaiNhom = int.Parse(maLoaiNhom);
                svcn.MaKhoaSv2 = maKhoaSV2;
                var nhom = dao.InsertNhomChinh(svcn);
                if (nhom > 0)
                {
                    RedirectToAction("DanhMucNhomChuyenNganh", "NoiDung");
                    SetAlert("Xác nhận thành công", "success");
                }
                else
                {
                    SetAlert("Xác nhận không thành công", "success");
                }
            }
            else if (user)
            {
                SetAlert("Bạn đã xác nhận nhóm này rồi", "error");
            }
            else if (checkuser)
            {
                SetAlert("Chỉ thành viên mới được xác nhận nhóm", "error");
            }
                          
            return RedirectToAction("DanhMucNhomChuyenNganh", "NoiDung");
        }
        [HttpGet]
        public ActionResult XacNhanNhomDoAnTotNghiep()
        {
            return View();
        }
        [HttpPost]
        public ActionResult XacNhanNhomDoAnTotNghiep(FormCollection coll)
        {
            var dao = new CheckThongTinDao();
            var maNhom = coll["MaNhom"];
            var maLoaiNhom = coll["MaLoaiNhom"];
            var tenLoaiDT = coll["TenLoaiDT"];
            var maUser = coll["MaUser"];
            var tenUser = coll["TenUser"];
            var maKhoaSV1 = coll["MaKhoaSV1"];
            var chucVuSv1 = coll["ChucVuSV1"];
            var maMember = coll["MaMember"];
            var tenMember = coll["TenMember"];
            var maKhoaSV2 = coll["MaKhoaSV2"];
            var chucVuSv2 = coll["ChucVuSV2"];
            var mauser = int.Parse(maUser);
            var mamember = int.Parse(maMember);
            var sesMaSV2 = Session["MaSV2TN"].ToString();
            var sesMaSV1 = int.Parse(Session["MaSV1TN"].ToString());
            var intMaSV2 = int.Parse(sesMaSV2);
            NhomSVChinh svcn = new NhomSVChinh();
            var checkmember = db.NhomSVs.Count(x => x.MaSV2 == intMaSV2) > 0;
            var checkuser = db.NhomSVs.Count(x => x.MaSV1 == sesMaSV1) > 0;
            var user = db.NhomSVChinhs.Count(x => x.MaSv1 == mauser && x.MaLoaiNhom == 2 || x.MaSv2 == mamember && x.MaLoaiNhom == 2) > 0;
            if (checkmember)
            {
                svcn.MaNhom = long.Parse(maNhom);
                svcn.TenLoaiDeTai = tenLoaiDT;
                svcn.MaKhoaSv1 = maKhoaSV1;
                svcn.MaSv1 = int.Parse(maUser);
                svcn.TenSv1 = tenUser;
                svcn.ChucVuSv1 = chucVuSv1;
                svcn.MaSv2 = int.Parse(maMember);
                svcn.TenSv2 = tenMember;
                svcn.ChucVuSv2 = chucVuSv2;
                svcn.MaLoaiNhom = int.Parse(maLoaiNhom);
                svcn.MaKhoaSv2 = maKhoaSV2;
                var nhom = dao.InsertNhomChinh(svcn);
                if (nhom > 0)
                {
                    RedirectToAction("DanhMucNhomTotNghiep", "NoiDung");
                    SetAlert("Xác nhận thành công", "success");
                }
                else
                {
                    SetAlert("Xác nhận không thành công", "success");
                }
            }
            else if (user)
            {
                SetAlert("Bạn đã xác nhận nhóm này rồi", "error");
            }
            else if (checkuser)
            {
                SetAlert("Chỉ thành viên mới được xác nhận nhóm", "error");
            }

            return RedirectToAction("DanhMucNhomTotNghiep", "NoiDung");
        }
        [HttpGet]
        public ActionResult XacNhanNhomKhoaLuan()
        {
            return View();
        }
        [HttpPost]
        public ActionResult XacNhanNhomKhoaLuan(FormCollection coll)
        {
            var dao = new CheckThongTinDao();         
            NhomSVChinh svcn = new NhomSVChinh();
            var mot = "1";
            svcn.MaNhom = long.Parse((Session["MaNhom"] + mot).ToString());
            svcn.TenLoaiDeTai = Session["TenLoaiDeTai"].ToString();
            svcn.MaKhoaSv1 = Session["MaKhoaSV1"].ToString();
            svcn.MaSv1 = int.Parse(Session["MaSV1"].ToString());
            svcn.TenSv1 = Session["TenSV1"].ToString();
            svcn.ChucVuSv1 = Session["ChucVuSV1"].ToString();
            svcn.MaSv2 = int.Parse(Session["MaSV2"].ToString());
            svcn.TenSv2 = Session["TenSV2"].ToString();
            svcn.ChucVuSv2 = Session["ChucVuSV2"].ToString();
            svcn.MaLoaiNhom = int.Parse(Session["MaLoaiNhom"].ToString());
            svcn.MaKhoaSv2 = Session["MaKhoaSV2"].ToString();
            var nhom = dao.InsertNhomChinh(svcn);
            if (nhom > 0)
            {
                RedirectToAction("DanhMucNhomKhoaLuan", "NoiDung");
                SetAlert("Xác nhận thành công", "success");
            }
            else
            {
                SetAlert("Xác nhận không thành công", "success");
            }
            return RedirectToAction("DanhMucNhomKhoaLuan", "NoiDung");
        }
    }
}