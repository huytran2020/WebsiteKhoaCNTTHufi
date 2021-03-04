using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace DoAnKhoaCNTT
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                name: "Lien he",
                url: "lien-he",
                defaults: new { controller = "About", action = "Index", id = UrlParameter.Optional },
                namespaces: new[] { "DoAnKhoaCNTT.Controller" }
            );
            routes.MapRoute(
                name: "TuyenSinh",
                url: "tuyen-sinh",
                defaults: new { controller = "NoiDung", action = "NoiDungTuyenSinh", id = UrlParameter.Optional },
                namespaces: new[] { "DoAnKhoaCNTT.Controller" }
            );
            routes.MapRoute(
                name: "TinTuc",
                url: "tin-tuc",
                defaults: new { controller = "NoiDung", action = "NoiDungTinTuc", id = UrlParameter.Optional },
                namespaces: new[] { "DoAnKhoaCNTT.Controller" }
            );
            routes.MapRoute(
                name: "KhoaHoc",
                url: "khoa-hoc",
                defaults: new { controller = "NoiDung", action = "NoiDungKhoaHoc", id = UrlParameter.Optional },
                namespaces: new[] { "DoAnKhoaCNTT.Controller" }
            );
            routes.MapRoute(
                name: "DaoTao",
                url: "dao-tao",
                defaults: new { controller = "NoiDung", action = "NoiDungDaoTao", id = UrlParameter.Optional },
                namespaces: new[] { "DoAnKhoaCNTT.Controller" }
            );
            routes.MapRoute(
                name: "GioiThieu",
                url: "gioi-thieu",
                defaults: new { controller = "NoiDung", action = "NoiDungGioiThieu", id = UrlParameter.Optional },
                namespaces: new[] { "DoAnKhoaCNTT.Controller" }
            );
            routes.MapRoute(
                name: "Đang nhap",
                url: "dang-nhap",
                defaults: new { controller = "TaiKhoan", action = "DangNhap", id = UrlParameter.Optional },
                namespaces: new[] { "DoAnKhoaCNTT.Controller" }
            );
            routes.MapRoute(
                name: "Đang xuat",
                url: "dang-xuat",
                defaults: new { controller = "TaiKhoan", action = "DangXuat", id = UrlParameter.Optional },
                namespaces: new[] { "DoAnKhoaCNTT.Controller" }
            );
            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional },
                namespaces: new[] {"DoAnKhoaCNTT.Controller"}
            );
        }
    }
}
