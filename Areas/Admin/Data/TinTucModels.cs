using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DoAnKhoaCNTT.Models.Database;
using PagedList;

namespace DoAnKhoaCNTT.Areas.Admin.Data
{
    public class TinTucModels
    {

        private KhoaCNTT context = null;
        public TinTucModels()
        {
            context = new KhoaCNTT();
        }
        public List<ConTentTinTuc> ListAll()
        {
            var list = context.Database.SqlQuery<ConTentTinTuc>("TinTuc_ListALL").ToList();
            return list;
        }
        public IEnumerable<ConTentTinTuc> ListAllPaging(int page, int pageSize)
        {
            return context.ConTentTinTucs.OrderByDescending(x => x.ModifiedDay).ToPagedList(page, pageSize);
        }

        public long Insert(ConTentTinTuc tintuc)
        {
            context.ConTentTinTucs.Add(tintuc);
            context.SaveChanges();
            return tintuc.IDConTent;

        }

        public ConTentTinTuc ViewDetail(int id)
        {
            return context.ConTentTinTucs.Find(id);
        }
        public bool Update(ConTentTinTuc tintuc)
        {
            try
            {
                var id = context.ConTentTinTucs.Find(tintuc.IDConTent);
                id.Name = tintuc.Name;
                id.MetaTitle = tintuc.MetaTitle;
                id.Description = tintuc.Description;
                id.Image = tintuc.Image;
                id.CategoryID = tintuc.CategoryID;
                id.Detail = tintuc.Detail;
                id.ModifiedDay = DateTime.Now;
                id.TopHot = tintuc.TopHot;
                id.IDTinTuc = tintuc.IDTinTuc;
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