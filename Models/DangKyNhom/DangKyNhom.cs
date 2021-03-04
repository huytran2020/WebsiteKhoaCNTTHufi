using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
namespace DoAnKhoaCNTT.Models.DangKyNhom
{
    public class DangKyNhom
    {
        [Key]
        public long stt { set; get; }

        [Display(Name = "Mã nhóm (Nhập mã số sinh viên nhóm trưởng)")]
        [Required(ErrorMessage = "Yêu cầu nhập mã nhóm")]
        public long manhom { set; get; }

        [Display(Name = "Tên loại đề tài")]
        [Required(ErrorMessage = "Yêu cầu nhập tên loại đề tài")]
        public string tenLoaiDT { set; get; }

        [Display(Name = "Mã khóa")]
        [Required(ErrorMessage = "Yêu cầu nhập mã khóa")]
        public string makhoa { set; get; }

        [Display(Name = "Mã sinh viên 1")]
        [Required(ErrorMessage = "Yêu cầu nhập mã sinh viên 1")]
        public long masv1 { set; get; }

        [Display(Name = "Tên sinh viên 1")]
        [Required(ErrorMessage = "Yêu cầu nhập tên sinh viên 1")]
        public string tensv1 { set; get; }

        [Display(Name = "Chức vụ sinh viên 1 (Trưởng nhóm hoặc Thành viên)")]
        [Required(ErrorMessage = "Yêu cầu nhập chức vụ sinh viên 1")]
        public string chucvu1 { set; get; }

        [Display(Name = "Mã sinh viên 2")]
        [Required(ErrorMessage = "Yêu cầu nhập mã sinh viên 2")]
        public long masv2 { set; get; }

        [Display(Name = "Tên sinh viên 2")]
        [Required(ErrorMessage = "Yêu cầu nhập tên sinh viên 2")]
        public string tensv2 { set; get; }

        [Display(Name = "Chức vụ sinh viên 2 (Trưởng nhóm hoặc Thành viên)")]
        [Required(ErrorMessage = "Yêu cầu nhập chức vụ sinh viên 2")]
        public string chucvu2 { set; get; }
    }
}