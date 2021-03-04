namespace DoAnKhoaCNTT.Models.Database
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class KhoaCNTT : DbContext
    {
        public KhoaCNTT()
            : base("name=Model1")
        {
        }

        public virtual DbSet<About> Abouts { get; set; }
        public virtual DbSet<Admin> Admins { get; set; }
        public virtual DbSet<Contact> Contacts { get; set; }
        public virtual DbSet<ContentTag> ContentTags { get; set; }
        public virtual DbSet<ConTentTinTuc> ConTentTinTucs { get; set; }
        public virtual DbSet<DanhSachDeTaiDaDangKy> DanhSachDeTaiDaDangKies { get; set; }
        public virtual DbSet<DeTai> DeTais { get; set; }
        public virtual DbSet<DoiTac> DoiTacs { get; set; }
        public virtual DbSet<Feedback> Feedbacks { get; set; }
        public virtual DbSet<Footer> Footers { get; set; }
        public virtual DbSet<GiaoVienHD> GiaoVienHDs { get; set; }
        public virtual DbSet<Khoa> Khoas { get; set; }
        public virtual DbSet<LienHe> LienHes { get; set; }
        public virtual DbSet<LoaiDeTai> LoaiDeTais { get; set; }
        public virtual DbSet<LoaiNhom> LoaiNhoms { get; set; }
        public virtual DbSet<Menu> Menus { get; set; }
        public virtual DbSet<MenuCon> MenuCons { get; set; }
        public virtual DbSet<MenuType> MenuTypes { get; set; }
        public virtual DbSet<NhomSV> NhomSVs { get; set; }
        public virtual DbSet<NhomSVChinh> NhomSVChinhs { get; set; }
        public virtual DbSet<SinhVien> SinhViens { get; set; }
        public virtual DbSet<Slide> Slides { get; set; }
        public virtual DbSet<SystemConfig> SystemConfigs { get; set; }
        public virtual DbSet<Tag> Tags { get; set; }
        public virtual DbSet<TaiKhoan> TaiKhoans { get; set; }
        public virtual DbSet<TinTuc> TinTucs { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<About>()
                .Property(e => e.MetaTitle)
                .IsUnicode(false);

            modelBuilder.Entity<About>()
                .Property(e => e.CreateBy)
                .IsUnicode(false);

            modelBuilder.Entity<About>()
                .Property(e => e.ModifiedBy)
                .IsUnicode(false);

            modelBuilder.Entity<About>()
                .Property(e => e.MetaDescriptions)
                .IsFixedLength();

            modelBuilder.Entity<Admin>()
                .Property(e => e.ID)
                .IsUnicode(false);

            modelBuilder.Entity<Admin>()
                .Property(e => e.Name)
                .IsFixedLength();

            modelBuilder.Entity<Admin>()
                .Property(e => e.Password)
                .IsFixedLength();

            modelBuilder.Entity<ContentTag>()
                .Property(e => e.TagID)
                .IsUnicode(false);

            modelBuilder.Entity<ConTentTinTuc>()
                .Property(e => e.MetaTitle)
                .IsUnicode(false);

            modelBuilder.Entity<ConTentTinTuc>()
                .Property(e => e.ModifiedBy)
                .IsUnicode(false);

            modelBuilder.Entity<ConTentTinTuc>()
                .Property(e => e.MetaDescriptions)
                .IsFixedLength();

            modelBuilder.Entity<DanhSachDeTaiDaDangKy>()
                .Property(e => e.MaDeTai)
                .IsFixedLength();

            modelBuilder.Entity<DanhSachDeTaiDaDangKy>()
                .Property(e => e.MaGVHD)
                .IsFixedLength();

            modelBuilder.Entity<DanhSachDeTaiDaDangKy>()
                .Property(e => e.MaKhoa)
                .IsFixedLength();

            modelBuilder.Entity<DeTai>()
                .Property(e => e.MaDeTai)
                .IsFixedLength();

            modelBuilder.Entity<DeTai>()
                .Property(e => e.MaKhoa)
                .IsFixedLength();

            modelBuilder.Entity<DeTai>()
                .Property(e => e.MaGV)
                .IsFixedLength();

            modelBuilder.Entity<Footer>()
                .Property(e => e.ID)
                .IsUnicode(false);

            modelBuilder.Entity<GiaoVienHD>()
                .Property(e => e.MaGiaoVien)
                .IsFixedLength();

            modelBuilder.Entity<GiaoVienHD>()
                .HasMany(e => e.DanhSachDeTaiDaDangKies)
                .WithOptional(e => e.GiaoVienHD)
                .HasForeignKey(e => e.MaGVHD);

            modelBuilder.Entity<GiaoVienHD>()
                .HasMany(e => e.DeTais)
                .WithOptional(e => e.GiaoVienHD)
                .HasForeignKey(e => e.MaGV);

            modelBuilder.Entity<Khoa>()
                .Property(e => e.MaKhoa)
                .IsFixedLength();

            modelBuilder.Entity<LoaiNhom>()
                .HasMany(e => e.NhomSVChinhs)
                .WithOptional(e => e.LoaiNhom)
                .HasForeignKey(e => e.MaLoaiNhom);

            modelBuilder.Entity<LoaiNhom>()
                .HasMany(e => e.NhomSVs)
                .WithOptional(e => e.LoaiNhom)
                .HasForeignKey(e => e.MaLoaiNhom);

            modelBuilder.Entity<Menu>()
                .HasMany(e => e.TinTucs)
                .WithOptional(e => e.Menu)
                .HasForeignKey(e => e.ParentID);

            modelBuilder.Entity<Menu>()
                .HasMany(e => e.MenuCons)
                .WithMany(e => e.Menus)
                .Map(m => m.ToTable("MenuTrungGian").MapLeftKey("MaMenu").MapRightKey("MaConMenu"));

            modelBuilder.Entity<MenuCon>()
                .HasMany(e => e.TinTucs)
                .WithOptional(e => e.MenuCon)
                .HasForeignKey(e => e.IDTypeMenu);

            modelBuilder.Entity<MenuType>()
                .HasMany(e => e.Menus)
                .WithOptional(e => e.MenuType)
                .HasForeignKey(e => e.TypeID);

            modelBuilder.Entity<NhomSV>()
                .Property(e => e.MaKhoaSV1)
                .IsFixedLength();

            modelBuilder.Entity<NhomSV>()
                .Property(e => e.MaKhoaSV2)
                .IsFixedLength();

            modelBuilder.Entity<NhomSVChinh>()
                .Property(e => e.MaKhoaSv1)
                .IsFixedLength();

            modelBuilder.Entity<NhomSVChinh>()
                .Property(e => e.MaKhoaSv2)
                .IsFixedLength();

            modelBuilder.Entity<SinhVien>()
                .Property(e => e.Password)
                .IsFixedLength();

            modelBuilder.Entity<SinhVien>()
                .Property(e => e.MaKhoa)
                .IsFixedLength();

            modelBuilder.Entity<SinhVien>()
                .HasMany(e => e.DanhSachDeTaiDaDangKies)
                .WithOptional(e => e.SinhVien)
                .HasForeignKey(e => e.MaSV1);

            modelBuilder.Entity<SinhVien>()
                .HasMany(e => e.NhomSVs)
                .WithOptional(e => e.SinhVien)
                .HasForeignKey(e => e.MaSV1);

            modelBuilder.Entity<SinhVien>()
                .HasMany(e => e.NhomSVs1)
                .WithOptional(e => e.SinhVien1)
                .HasForeignKey(e => e.MaSV2);

            modelBuilder.Entity<SinhVien>()
                .HasMany(e => e.NhomSVChinhs)
                .WithOptional(e => e.SinhVien)
                .HasForeignKey(e => e.MaSv1);

            modelBuilder.Entity<SinhVien>()
                .HasMany(e => e.NhomSVChinhs1)
                .WithOptional(e => e.SinhVien1)
                .HasForeignKey(e => e.MaSv2);

            modelBuilder.Entity<SinhVien>()
                .HasOptional(e => e.TaiKhoan)
                .WithRequired(e => e.SinhVien);

            modelBuilder.Entity<Slide>()
                .Property(e => e.CreateBy)
                .IsUnicode(false);

            modelBuilder.Entity<Slide>()
                .Property(e => e.ModifiedBy)
                .IsUnicode(false);

            modelBuilder.Entity<SystemConfig>()
                .Property(e => e.ID)
                .IsUnicode(false);

            modelBuilder.Entity<SystemConfig>()
                .Property(e => e.Type)
                .IsUnicode(false);

            modelBuilder.Entity<Tag>()
                .Property(e => e.ID)
                .IsUnicode(false);

            modelBuilder.Entity<TaiKhoan>()
                .Property(e => e.MatKhau)
                .IsFixedLength();

            modelBuilder.Entity<TinTuc>()
                .Property(e => e.MetaTitle)
                .IsUnicode(false);

            modelBuilder.Entity<TinTuc>()
                .Property(e => e.CreateBy)
                .IsUnicode(false);

            modelBuilder.Entity<TinTuc>()
                .Property(e => e.ModifiedBy)
                .IsUnicode(false);

            modelBuilder.Entity<TinTuc>()
                .Property(e => e.MetaDescriptions)
                .IsFixedLength();

            modelBuilder.Entity<TinTuc>()
                .HasMany(e => e.ConTentTinTucs)
                .WithOptional(e => e.TinTuc)
                .HasForeignKey(e => e.IDTinTuc);
        }
    }
}
