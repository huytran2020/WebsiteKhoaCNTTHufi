using DoAnKhoaCNTT.Areas.Admin.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DoAnKhoaCNTT.Models.Database;

namespace DoAnKhoaCNTT.Areas.Admin.Controllers
{
    public class ContentTinTucController : Controller
    {
        // GET: Admin/ContentTinTuc
        public ActionResult Index(int page = 1, int pageSize = 10)
        {
            var ipTT = new TinTucModels();
            var model = ipTT.ListAllPaging(page, pageSize);
            return View(model);
        }
        [HttpGet]
        public ActionResult IndexTT()
        {
            return View();
        }
        [HttpGet]
        public ActionResult Edit(int id)
        {
            var idTT = new TinTucModels().ViewDetail(id);
            return View(idTT);
        }
        [HttpPost]
        public ActionResult Create(ConTentTinTuc tintuc)
        {
            if (ModelState.IsValid)
            {
                var dao = new TinTucModels();
                long id = dao.Insert(tintuc);
                if (id > 0)
                {
                    return RedirectToAction("Index", "ContentTinTuc");
                }
                else
                {
                    ModelState.AddModelError("", "Thêm tin tức ko thành công !");
                }
            }
            return View("Index");
        }

        [HttpPost]
        public ActionResult Update(ConTentTinTuc tintuc)
        {
            if (ModelState.IsValid)
            {
                var dao = new TinTucModels();
                var result = dao.Update(tintuc);
                if (result)
                {
                    return RedirectToAction("Index", "ContentTinTuc");
                }
                else
                {
                    ModelState.AddModelError("", "Cập nhật tin tức không thành công !");
                    return View("Index");
                }
            }
            return View("Index");
        }
    }
}