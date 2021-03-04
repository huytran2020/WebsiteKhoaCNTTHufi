using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DoAnKhoaCNTT.Models.Database;
using PagedList;

namespace DoAnKhoaCNTT.Areas.Admin.Data
{
    public class KhoaLuanModels
    {
        private KhoaCNTT context = null;
        public KhoaLuanModels()
        {
            context = new KhoaCNTT();
        }
        public List<DeTai> ListAll()
        {
            var list = context.Database.SqlQuery<DeTai>("Detai_ListALL").ToList();
            return list;
        }

        public IEnumerable<DeTai> ListAllPaging(int page, int pageSize)
        {
            return context.DeTais.OrderByDescending(x => x.MaDeTai).ToPagedList(page, pageSize);
        }

        public string Insert(DeTai dt)
        {
            context.DeTais.Add(dt);
            context.SaveChanges();
            return dt.MaDeTai;

        }

        public DeTai ViewDetail(int id)
        {
            return context.DeTais.Find(id);
        }
        public bool Update(DeTai dt)
        {
            try
            {
                var id = context.DeTais.Find(dt.MaDeTai);
                id.MaDeTai = dt.MaDeTai;
                id.TenDeTai = dt.TenDeTai;
                context.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }
    }
}