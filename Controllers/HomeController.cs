using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DoAnKhoaCNTT.Dao;
namespace DoAnKhoaCNTT.Controllers
{
    public class HomeController : Controller
    {
        //GET: Home
        public ActionResult Index()
        {
            //gọi dữ liệu cho nội dung tuyển sinh
            var noidungdao = new NoiDungDao();
            ViewBag.NewNoiDungs = noidungdao.ListNewNoiDung(1);
            ViewBag.NoiDungCus = noidungdao.ListNoiDungCu(2);
            //gọi dữ liệu cho nội dung đào tạo
            var daotaodao = new DaoTaoDao();
            ViewBag.NewNoiDungDaoTaos = daotaodao.ListNewNoiDungDaoTao(1);
            ViewBag.NoiDungDaoTaoCus = daotaodao.ListNoiDungDaoTaoCu(2);
            //gọi dữ liệu cho nội dung công nghệ
            var congnghedao = new CongNgheDao();
            ViewBag.NewNoiDungCongNghes = congnghedao.ListNewNoiDungCongNghe(1);
            ViewBag.NoiDungCongNgheCus = congnghedao.ListNoiDungCongNgheCu(2);
            //gọi dữ liệu cho nội dung tin tức
            var tintucdao = new TinTucDao();
            ViewBag.NewNoiDungTinTucs = tintucdao.ListNewNoiDungTinTuc(1);
            ViewBag.NoiDungTinTucCus = tintucdao.ListNoiDungTinTucCu(2);
            //gọi dữ liệu cho nội dung giới thiệu
            var gioithieudao = new GioiThieuDao();
            ViewBag.NewNoiDungGioiThieus = gioithieudao.ListNewNoiDungGioiThieu(1);
            ViewBag.NoiDungGioiThieuCus = gioithieudao.ListNoiDungGioiThieuCu(2);
            return View();

        }
        [ChildActionOnly]
        public ActionResult DoiTac()
        {
            var model = new DoiTacDao().ListByGroupID(1);
            return PartialView(model);
        }
        [ChildActionOnly]
        public ActionResult TuyenSinhMoiNhat()
        {
            var model = new TuyenSinhMoiNhatDao().ListByGroupID(1);
            return PartialView(model);
        }
        
        public ActionResult MainMenu()
        {
            var model = new MenuDao().LisByFroupId(1);
            return PartialView(model);
        }
        public ActionResult TopMenu()
        {
            var model1 = new MenuDao().LisByFroupId(2);
            return PartialView(model1);
        }
        public ActionResult MenuDangXuat()
        {
            var model2 = new MenuDao().LisByFroupId(3);
            return PartialView(model2);
        }
    }
}