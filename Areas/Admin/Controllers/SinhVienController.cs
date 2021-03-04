using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DoAnKhoaCNTT.Areas.Admin.Data;

namespace DoAnKhoaCNTT.Areas.Admin.Controllers
{
    public class SinhVienController : Controller
    {
        // GET: Admin/SinhVien
        public ActionResult Index(int page = 1, int pageSize = 10)
        {
            var ipTT = new SVModels();
            var model = ipTT.ListAllPaging(page, pageSize);
            return View(model);
        }
    }
}