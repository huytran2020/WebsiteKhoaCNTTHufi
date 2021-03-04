using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DoAnKhoaCNTT.Models.Database;
namespace DoAnKhoaCNTT.Dao
{
    public class NoiDungDao
    {
        KhoaCNTT db = null;
        public NoiDungDao()
        {
            db = new KhoaCNTT();
        }
        public List<ConTentTinTuc> ListNewNoiDung(int top)
        {
            return db.ConTentTinTucs.Where(x=>x.CategoryID == 1).OrderByDescending(x => x.ModifiedDay).Take(top).ToList();
        }
        public List<ConTentTinTuc> ListNoiDungCu(int top)
        {
            return db.ConTentTinTucs.Where(x=>x.TopHot !=null && x.TopHot < DateTime.Now && x.CategoryID == 1).OrderByDescending(x => x.ModifiedDay).Take(top).ToList();
        }
        
    }
}