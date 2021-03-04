using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DoAnKhoaCNTT.Dao;
using DoAnKhoaCNTT.Models.Database;
using PagedList;
using PagedList.Mvc;

namespace DoAnKhoaCNTT.Controllers
{
    public class NoiDungController : Controller
    {
        // GET: NoiDung
        private KhoaCNTT db = new KhoaCNTT();
        
        public ActionResult Index()
        {
           
            return View();
        }
        public ActionResult ChiTietNoiDung(int maTT)
        {
            return View(db.ConTentTinTucs.FirstOrDefault(sp => sp.IDConTent == maTT));
        }
        public ActionResult XemThemNoiDung(int maXemTT)
        {
            return View(db.ConTentTinTucs.FirstOrDefault(sp => sp.IDTinTuc == maXemTT));
        }
        // phân trang nội dung tuyển sinh
        public ActionResult NoiDungTuyenSinh()
        {
            
            var xemnoidungtuyensinhdao = new XemThemNoiDungTuyenSinhDao();
            ViewBag.XemThemNoiDungTuyenSinhs = xemnoidungtuyensinhdao.ListNoiDungTuyenSinh();
            
            return View();
        }
        public PartialViewResult GetPaging(int? page )
        {
            var xemnoidungtuyensinhdao = new XemThemNoiDungTuyenSinhDao();
            ViewBag.XemThemNoiDungTuyenSinhs = xemnoidungtuyensinhdao.ListNoiDungTuyenSinh();
            int pageSize = 6;
            int pageNumber = (page ?? 1);
            return PartialView("DanhSachNoiDung", db.ConTentTinTucs.Where(x => x.CategoryID == 1).OrderBy(s => s.IDConTent).ToPagedList(pageNumber, pageSize));
        }
        //-------------------------------------------------------------------------------------//

        // phân trang nội dung tin tức
        public ActionResult NoiDungTinTuc()
        {
            var xemnoidungtuyensinhdao = new XemThemNoiDungDaoTinTuc();
            ViewBag.XemThemNoiDungTinTucs = xemnoidungtuyensinhdao.ListNoiDungTinTuc();
            return View();
        }
        public PartialViewResult GetPagingTT(int? page)
        {
            var xemnoidungtuyensinhdao = new XemThemNoiDungDaoTinTuc();
            ViewBag.XemThemNoiDungTinTucs = xemnoidungtuyensinhdao.ListNoiDungTinTuc();
            int pageSize = 6;
            int pageNumber = (page ?? 1);
            return PartialView("DanhSachNoiDungTinTuc", db.ConTentTinTucs.Where(x => x.CategoryID == 3).OrderBy(s => s.IDConTent).ToPagedList(pageNumber, pageSize));
        }
        //-------------------------------------------------------------------------------------//

        // Phân trang danh sách khoa học
        public ActionResult NoiDungKhoaHoc()
        {
            var xemnoidungkhoahocdao = new XemThemNoiDungKhoaHocDao();
            ViewBag.XemThemNoiDungKhoaHocs = xemnoidungkhoahocdao.ListNoiDungKhoaHoc();
            return View();
        }
        public PartialViewResult GetPagingKH(int? page)
        {
            int pageSize = 6;
            int pageNumber = (page ?? 1);
            return PartialView("DanhSachNoiDungKhoaHoc", db.ConTentTinTucs.Where(x => x.CategoryID == 5).OrderBy(s => s.IDConTent).ToPagedList(pageNumber, pageSize));
        }
        //-------------------------------------------------------------------------------------//

        // Phân trang danh sách đào tạo
        public ActionResult NoiDungDaoTao()
        {
            var xemnoidungdaotaodao = new XemThemNoiDungDaoTaoDao();
            ViewBag.XemThemNoiDungDaoTaos = xemnoidungdaotaodao.ListNoiDungDaoTao();
            return View();
        }
        public PartialViewResult GetPagingDT(int? page)
        {           
            int pageSize = 6;
            int pageNumber = (page ?? 1);
            return PartialView("DanhSachNoiDungDaoTao", db.ConTentTinTucs.Where(x => x.CategoryID == 2).OrderBy(s => s.IDConTent).ToPagedList(pageNumber, pageSize));
        }
        //-------------------------------------------------------------------------------------//

        // Phân trang danh sách giới thiệu
        public ActionResult NoiDungGioiThieu()
        {
            var xemnoidungdaogioithieu = new XemThemNoiDungGioiThieuDao();
            ViewBag.XemThemNoiDungGioiThieus = xemnoidungdaogioithieu.ListNoiDungGioiThieu();
            return View();
        }
        public PartialViewResult GetPagingGT(int? page)
        {
            int pageSize = 6;
            int pageNumber = (page ?? 1);
            return PartialView("DanhSachNoiDungGioiThieu", db.ConTentTinTucs.Where(x => x.CategoryID == 4).OrderBy(s => s.IDConTent).ToPagedList(pageNumber, pageSize));
        }
        
        //Xem chi tiết đề tài
        public ActionResult XemChiTietDeTai(string maXemDT)
        {
            return View(db.DeTais.FirstOrDefault(sp => sp.MaDeTai == maXemDT));
        }




        //-------------------------------------------------------Khóa luận----------------------------------------------------------------//


        //Phân trang danh sách đề tài khóa luận
        public ActionResult DanhMucKhoaLuan()
        {
            var xemdanhsachkhoaluandao = new DanhSachDeTaiDao();
            ViewBag.DanhSachDeTaiKLs = xemdanhsachkhoaluandao.ListDeTaiKhoaLuan();
            return View();
        }
        public PartialViewResult GetPagingKL(int? page)
        {
            int pageSize = 6;
            int pageNumber = (page ?? 1);
            return PartialView("DanhSachKhoaLuan", db.DeTais.Where(x => x.MaLoai == 5).OrderBy(s => s.MaDeTai).ToPagedList(pageNumber, pageSize));
        }
        //-------------------------------------------------------------------------------------//

        //Phân trang danh sách sinh viên khóa luận
        public ActionResult DanhMucSinhVienKhoaLuan()
        {
            var xemsvkhoaluandao = new DanhSachSinhVienDao();
            ViewBag.DanhSachSVKhoaLuans = xemsvkhoaluandao.ListSinhVienKhoaLuan();
            return View();
        }
        public PartialViewResult GetPagingSVKL(int? page)
        {
            int pageSize = 6;
            int pageNumber = (page ?? 1);
            return PartialView("DanhSachSinhVienKhoaLuan", db.SinhViens.Where(x => x.MaLoaiDeTai == 2).OrderBy(s => s.MaSinhVien).ToPagedList(pageNumber, pageSize));
        }
        //-------------------------------------------------------------------------------------//
        // phân trang nhóm đăng ký nhóm khóa luận
        public ActionResult DangKyNhomKhoaLuan()
        {

            return View();
        }
        public PartialViewResult GetPagingDangKyNhomKL(int? page)
        {
            int pageSize = 6;
            int pageNumber = (page ?? 1);
            return PartialView("PageMoiSVKhoaLuan", db.SinhViens.Where(x => x.MaLoaiDeTai == 2).OrderBy(s => s.MaSinhVien).ToPagedList(pageNumber, pageSize));
        }

        //Phân trang danh sách nhóm khóa luận
        public ActionResult DanhMucNhomKhoaLuan()
        {           
            return View();
        }
        public PartialViewResult GetPagingNhomKL(int? page)
        {
            int pageSize = 6;
            int pageNumber = (page ?? 1);
            return PartialView("DanhSachNhomKhoaLuan", db.NhomSVChinhs.Where(x => x.MaLoaiNhom == 3).OrderBy(s => s.MaNhom).ToPagedList(pageNumber, pageSize));
        }
        //-------------------------------------------------------------------------------------//
        //Phân trang đăng ký đề tài khóa luận
        public ActionResult DangKyDeTaiKhoaLuan()
        {

            return View();
        }
        public PartialViewResult GetPagingDangKyDTKL(int? page)
        {
            int pageSize = 6;
            int pageNumber = (page ?? 1);        
            return PartialView("PageDangKyDTKhoaLuan", db.DeTais.Where(x => x.MaLoai == 5 ).OrderBy(s => s.MaDeTai).ToPagedList(pageNumber, pageSize));
        }



        //-----------------------------------------------------------------/Nội dung đồ án/-------------------------------------------------------
        //menu khóa luận
        public ActionResult MenuDeTai()
        {
            return PartialView();
        }
        //menu đồ án
        public ActionResult MenuDeTaiDoAn()
        {     
            return PartialView();
        }
        //phân trang danh sách đồ án chuyên ngành
        public ActionResult DanhMucDoAnChuyenNganh()
        {
            var xemnoidungtuyensinhdao = new DanhSachDeTaiDao();
            ViewBag.DanhSachDeTais = xemnoidungtuyensinhdao.ListDeTai();
            return View();
        }
        public PartialViewResult GetPagingDACN(int? page)
        {
            int pageSize = 4;
            int pageNumber = (page ?? 1);
            return PartialView("DanhSachDoAnChuyenNganh", db.DeTais.Where(x => x.MaLoai == 3).OrderBy(s => s.MaDeTai).ToPagedList(pageNumber, pageSize));
        }
        //-------------------------------------------------------------------------------------//

        //Phân trang danh sách đồ án tốt nghiệp
        public ActionResult DanhMucDoAnTotNghiep()
        {
            var xemnoidungtuyensinhdao = new DanhSachDeTaiDao();
            ViewBag.DanhSachDeTais = xemnoidungtuyensinhdao.ListDeTai();
            return View();
        }
        public PartialViewResult GetPagingDATN(int? page)
        {
            int pageSize = 4;
            int pageNumber = (page ?? 1);
            return PartialView("DanhSachDoAnTotNghiep", db.DeTais.Where(x => x.MaLoai == 4).OrderBy(s => s.MaDeTai).ToPagedList(pageNumber, pageSize));
        }
        //-------------------------------------------------------------------------------------//

        //Phân tranh danh mục sinh viên đồ án
        public ActionResult DanhMucSinhVienDoAn()
        {
            var xemsvdoandao = new DanhSachSinhVienDao();
            ViewBag.DanhSachSVDoAns = xemsvdoandao.ListSinhVienDoAn();
            return View();
        }
        public PartialViewResult GetPagingSVDA(int? page)
        {
            int pageSize = 8;
            int pageNumber = (page ?? 1);
            return PartialView("DanhSachSinhVienChuyenNganh", db.SinhViens.Where(x => x.MaLoaiDeTai == 1).OrderBy(s => s.MaSinhVien).ToPagedList(pageNumber, pageSize));
        }
        //Phân trang danh sách nhóm đồ án chuyên ngành
        public ActionResult DanhMucNhomChuyenNganh()
        {
            //var xemsvkhoaluandao = new DanhSachSinhVienDao();
            //ViewBag.DanhSachSVKhoaLuans = xemsvkhoaluandao.ListSinhVienKhoaLuan();
            return View();
        }
        public PartialViewResult GetPagingNhomCN(int? page)
        {
            int pageSize = 6;
            int pageNumber = (page ?? 1);
            return PartialView("DanhSachNhomChuyenNganh", db.NhomSVChinhs.Where(x => x.MaLoaiNhom == 1).OrderBy(s => s.MaNhom).ToPagedList(pageNumber, pageSize));
        }
        //-------------------------------------------------------------------------------------//

        //Phân trang danh sách nhóm đồ án tốt nghiệp
        public ActionResult DanhMucNhomTotNghiep()
        {
            //var xemsvkhoaluandao = new DanhSachSinhVienDao();
            //ViewBag.DanhSachSVKhoaLuans = xemsvkhoaluandao.ListSinhVienKhoaLuan();
            return View();
        }
        public PartialViewResult GetPagingNhomTN(int? page)
        {
            int pageSize = 6;
            int pageNumber = (page ?? 1);
            return PartialView("DanhSachNhomTotNghiep", db.NhomSVChinhs.Where(x => x.MaLoaiNhom == 2).OrderBy(s => s.MaNhom).ToPagedList(pageNumber, pageSize));
        }
        

        //-------------------------------------------------------------------------------------//
        // phân trang đăng ký nhóm chuyên ngành
        public ActionResult DangKyNhomChuyenNganh()
        {
            
            return View();
        }
        public PartialViewResult GetPagingDangKyCN(int? page)
        {
            int pageSize = 6;
            int pageNumber = (page ?? 1);           
            return PartialView("PageMoiSVChuyenNganh", db.SinhViens.Where(x => x.MaLoaiDeTai == 1).OrderBy(s => s.MaSinhVien).ToPagedList(pageNumber, pageSize));
        }
        //-------------------------------------------------------------------------------------//

        //Phân trang đăng ký nhóm đồ án tốt nghiệp
        public ActionResult DangKyNhomTotNghiep()
        {

            return View();
        }
        public PartialViewResult GetPagingDangKyTN(int? page)
        {
            int pageSize = 6;
            int pageNumber = (page ?? 1);
            return PartialView("PageMoiSVTotNghiep", db.SinhViens.Where(x => x.MaLoaiDeTai == 1).OrderBy(s => s.MaSinhVien).ToPagedList(pageNumber, pageSize));
        }
        //-------------------------------------------------------------------------------------//

        //Phân trang đăng ký đề tài đồ án chuyên ngành
        public ActionResult DangKyDeTaiChuyenNganh()
        {

            return View();
        }
        public PartialViewResult GetPagingDangKyDTCN(int? page)
        {
            int pageSize = 6;
            int pageNumber = (page ?? 1);
            return PartialView("PageDangKyDTChuyenNganh", db.DeTais.Where(x => x.MaLoai == 3).OrderBy(s => s.MaDeTai).ToPagedList(pageNumber, pageSize));
        }
        //-------------------------------------------------------------------------------------//

        //Phân trang đăng ký đề tài đồ án tốt nghiệp
        public ActionResult DangKyDeTaiTotNghiep()
        {

            return View();
        }
        public PartialViewResult GetPagingDangKyDTTN(int? page)
        {
            int pageSize = 6;
            int pageNumber = (page ?? 1);
            return PartialView("PageDangKyDTTotNghiep", db.DeTais.Where(x => x.MaLoai == 4).OrderBy(s => s.MaDeTai).ToPagedList(pageNumber, pageSize));
        }

        //------------------------------------Nhóm chờ------------------------------------------------------------------------------------//
        //Danh sách nhóm chờ chuyên ngành
        public ActionResult DanhMucNhomChoCN()
        {
            var xemsvkhoaluandao = new DanhSachSinhVienDao();
            ViewBag.DanhSachSVKhoaLuans = xemsvkhoaluandao.ListSinhVienKhoaLuan();
            return View();
        }
        //Danh sách nhóm chờ tốt nghiệp
        public ActionResult DanhMucNhomChoTN()
        {
            var xemsvkhoaluandao = new DanhSachSinhVienDao();
            ViewBag.DanhSachSVKhoaLuans = xemsvkhoaluandao.ListSinhVienKhoaLuan();
            return View();
        }
        //Danh sách nhóm chờ khóa luận
        public ActionResult DanhMucNhomChoKL()
        {
            var xemsvkhoaluandao = new DanhSachSinhVienDao();
            ViewBag.DanhSachSVKhoaLuans = xemsvkhoaluandao.ListSinhVienKhoaLuan();
            return View();
        }
    }
}