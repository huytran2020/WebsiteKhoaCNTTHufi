using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DoAnKhoaCNTT.Models.Database;
namespace DoAnKhoaCNTT.Dao
{
    public class TuyenSinhMoiNhatDao
    {
        KhoaCNTT db = null;
        public TuyenSinhMoiNhatDao()
        {
            db = new KhoaCNTT();
        }
        public List<ConTentTinTuc> ListByGroupID(int group)
        {
            return db.ConTentTinTucs.Where(x => x.IDTinTuc == group && x.Status == true).ToList();
        }
    }
}