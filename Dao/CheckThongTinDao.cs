using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DoAnKhoaCNTT.Models.Database;
using PagedList;
using PagedList.Mvc;
namespace DoAnKhoaCNTT.Dao
{
    public class CheckThongTinDao
    {
        private KhoaCNTT db = null;
        public CheckThongTinDao()
        {
            db = new KhoaCNTT();
        }
        public bool CheckMaDeTai(string maDT)
        {
            return db.DanhSachDeTaiDaDangKies.Count(x => x.MaDeTai == maDT) > 0;
        }
        public bool CheckMaNhomTruong(long maNT, string tenNT)
        {
            return db.NhomSVs.Count(x => x.MaSV1 == maNT && x.TenSV1 == tenNT) < 1;
        }
        public bool CheckMaNhomDangKy(long manhom)
        {
            return db.DanhSachDeTaiDaDangKies.Count(x => x.MaNhom == manhom) > 0;
        }
        
        //public long Insert(DanhSachDeTaiDaDangKy entity)
        //{
        //    db.DanhSachDeTaiDaDangKies.Add(entity);
        //    db.SaveChanges();
        //    return entity.MaDeTaiDaDangKi;
        //}
        public bool CheckMaNhom(long maDT)
        {
            return db.NhomSVs.Count(x => x.MaNhom == maDT) > 0;
        }
        public bool CheckMaTruongNhom(long maSv1)
        {
            return db.NhomSVs.Count(x => x.MaSV1 == maSv1 ) > 0;
        }
        public bool CheckMaNhomSV(long manhom)
        {
            return db.SinhViens.Count(x => x.MaNhom == manhom) > 0;
        }
        public bool CheckMaThanhVien(long maSv2)
        {
            return db.NhomSVs.Count(x => x.MaSV2 == maSv2) > 0;
        }
        
        public long InsertNhom(NhomSV entity)
        {
            db.NhomSVs.Add(entity);
            db.SaveChanges();
            return entity.MaNhom;
        }
        public long InsertNhomChinh(NhomSVChinh entity)
        {
            db.NhomSVChinhs.Add(entity);
            db.SaveChanges();
            return entity.MaNhom;
        }
        public long InsertDeTai(DanhSachDeTaiDaDangKy entity)
        {
            db.DanhSachDeTaiDaDangKies.Add(entity);
            db.SaveChanges();
            return entity.MaDeTaiDaDangKi;
        }
      
        
    }
}