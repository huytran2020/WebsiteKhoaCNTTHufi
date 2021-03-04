using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DoAnKhoaCNTT.Dao;
using DoAnKhoaCNTT.Models.Database;
namespace DoAnKhoaCNTT.Controllers
{
    public class DangKyNhomKhoaLuanController : Controller
    {
        // GET: DangKyNhomKhoaLuan
        private KhoaCNTT db = new KhoaCNTT();
        public ActionResult DangKyNhomKhoaLuan(long maSV)
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
        public ActionResult DangKyNhomKhoaLuan(FormCollection coll)
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
            var user = db.NhomSVs.Count(x => x.MaSV1 == checkuser && x.MaLoaiNhom == 3 || x.MaSV2 == checkuser && x.MaLoaiNhom == 3) > 0;
            var member = db.NhomSVs.Count(x => x.MaSV2 == checkmember && x.MaLoaiNhom == 3 || x.MaSV1 == checkmember && x.MaLoaiNhom == 3) > 0;
            NhomSV sv = new NhomSV();
            if (user)
            {
                SetAlert("Bạn đã đăng kí nhóm này rồi", "error");
                RedirectToAction("DanhMucNhomKhoaLuan", "NoiDung");
            }
            else if (member)
            {
                SetAlert("Bạn của bạn đã đăng kí nhóm rồi", "error");
                RedirectToAction("DanhMucNhomKhoaLuan", "NoiDung");
            }
            else
            {
                var mot = "1";
                long manhom = long.Parse((maUser + mot).ToString());
                sv.MaNhom = manhom;
                sv.TenLoaiDeTai = "Khóa luận tốt nghiệp";
                sv.MaKhoaSV1 = maKhoaSV1;
                sv.MaSV1 = int.Parse(maUser);
                sv.TenSV1 = tenUser;
                sv.ChucVuSV1 = "Trưởng nhóm";
                sv.MaSV2 = int.Parse(maMember);
                sv.TenSV2 = tenMember;
                sv.ChucVuSV2 = "Thành viên";
                sv.MaLoaiNhom = 3;
                sv.MaKhoaSV2 = maKhoaSV2;
                var nhom = dao.InsertNhom(sv);
                RedirectToAction("DanhMucNhomKhoaLuan", "NoiDung");
                if (nhom > 0)
                {
                    SetAlert("Mời thành viên thành công! Chờ xác nhận nhóm từ thành viên", "success");
                }
                else
                {
                    SetAlert("Đăng ký không thành công", "success");
                }
            }
            return RedirectToAction("DanhMucNhomKhoaLuan", "NoiDung");
        }
    }
}