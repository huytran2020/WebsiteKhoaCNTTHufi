using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DoAnKhoaCNTT.Models.Database;
namespace DoAnKhoaCNTT.Dao
{
    public class XemThemNoiDungKhoaHocDao
    {
        KhoaCNTT db = null;
        public XemThemNoiDungKhoaHocDao()
        {
            db = new KhoaCNTT();
        }
        public List<ConTentTinTuc> ListNoiDungKhoaHoc()
        {
            return db.ConTentTinTucs.Where(x => x.CategoryID == 5).ToList();
        }
    }
}