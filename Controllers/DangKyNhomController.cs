using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DoAnKhoaCNTT.Models.Database;
using DoAnKhoaCNTT.Models;
using DoAnKhoaCNTT.Dao;
using DoAnKhoaCNTT.Models.DangKyNhom;

namespace DoAnKhoaCNTT.Controllers
{
    public class DangKyNhomController : Controller
    {
        private KhoaCNTT db = new KhoaCNTT();
        // GET: DangKyNhom
        public ActionResult DangKyNhom()
        {
            return View();
        }
        [HttpPost]
        public ActionResult DangKyNhom(DangKyNhom model)
        {
            if (ModelState.IsValid)
            {
                var dao = new CheckThongTinDao();
                var kt = new SinhVien();
                if (dao.CheckMaNhom(model.manhom))
                {
                    ModelState.AddModelError("", "Mã nhóm đã tồn tại");
                }
                else if (dao.CheckMaTruongNhom(model.masv1))
                {
                    ModelState.AddModelError("", "Sinh viên 1 đã đăng kí nhóm");
                }
                else if (dao.CheckMaThanhVien(model.masv2))
                {
                    ModelState.AddModelError("", "Sinh viên 2 đã đăng kí nhóm");
                }
                else if (model.chucvu1 == "Trưởng nhóm" && model.chucvu2 == "Trưởng nhóm")
                {
                    ModelState.AddModelError("", "Một nhóm chỉ có một trưởng nhóm");
                }
                else if (model.chucvu1 == "Thành viên" && model.chucvu2 == "Thành viên")
                {
                    ModelState.AddModelError("", "Một nhóm phải có một trưởng nhóm");
                }
                else
                {
                    var dt = new NhomSV();
                    dt.MaNhom = model.manhom;
                    dt.TenLoaiDeTai = model.tenLoaiDT;
                    dt.MaKhoaSV1 = model.makhoa;
                    dt.MaSV1 = model.masv1;
                    dt.TenSV1 = model.tensv1;
                    dt.ChucVuSV1 = model.chucvu1;
                    dt.MaSV2 = model.masv2;
                    dt.TenSV2 = model.tensv2;
                    dt.ChucVuSV2 = model.chucvu2;
                    var nhom = dao.InsertNhom(dt);
                    if (nhom > 0)
                    {
                        ModelState.AddModelError("", "Đăng ký thành công");
                        //ViewBag.Success = "Đăng kí thành công";
                        model = new DangKyNhom();
                    }
                    else
                    {
                        ModelState.AddModelError("", "Đăng ký không thành công");
                    }
                }
            }
            return View(model);   
        }
        public ActionResult NhomDoAn()
        {

            return View();
        }
    }
}