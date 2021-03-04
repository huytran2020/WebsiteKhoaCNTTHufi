using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DoAnKhoaCNTT.Models.Database;
using PagedList;

namespace DoAnKhoaCNTT.Areas.Admin.Data
{
    public class SVModels
    {
        private KhoaCNTT context = null;
        public SVModels()
        {
            context = new KhoaCNTT();
        }
        public List<SinhVien> ListAll()
        {
            var list = context.Database.SqlQuery<SinhVien>("SV_ListALL").ToList();
            return list;
        }
        public IEnumerable<SinhVien> ListAllPaging(int page, int pageSize)
        {
            return context.SinhViens.OrderByDescending(x => x.MaSinhVien).ToPagedList(page, pageSize);
        }
    }
}