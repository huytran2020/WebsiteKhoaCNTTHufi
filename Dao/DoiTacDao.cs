using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DoAnKhoaCNTT.Models.Database;
namespace DoAnKhoaCNTT.Dao
{
    public class DoiTacDao
    {
        KhoaCNTT db = null;
        public DoiTacDao()
        {
            db = new KhoaCNTT();
        }
        public List<DoiTac> ListByGroupID (int group)
        {
            return db.DoiTacs.Where(x => x.DisplayOrder == group).ToList();
        }
    }
}