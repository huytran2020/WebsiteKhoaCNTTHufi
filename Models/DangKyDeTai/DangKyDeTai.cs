using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
namespace DoAnKhoaCNTT.Models.DangKyDeTai
{
    public class DangKyDeTai
    {
        [Key]
        public long MaDTDaDangKy { set; get; }

        [Display(Name = "Mã đề tài")]
        [Required(ErrorMessage = "Yêu cầu nhập mã đề tài")]
        public string maDeTai { set; get; }

        [Display(Name = "Tên đề tài")]
        [Required(ErrorMessage = "Yêu cầu nhập tên đề tài")]
        public string tenDeTai { set; get; }

        [Display(Name = "Tên loại đề tài")]
        [Required(ErrorMessage = "Yêu cầu nhập tên loại đề tài")]
        public string tenLoaiDeTai { set; get; }

        [Display(Name = "Mã giáo viên hướng dẫn")]
        [Required(ErrorMessage = "Yêu cầu nhập mã giáo viên hướng dẫn")]
        public string maGVHD { set; get; }

        [Display(Name = "Mã khóa")]
        [Required(ErrorMessage = "Yêu cầu nhập mã khóa")]
        public string maKhoa { set; get; }

        [Display(Name = "Mã sinh viên trưởng nhóm")]
        [Required(ErrorMessage = "Yêu cầu nhập mã sinh viên 1")]
        public long maSv1 { set; get; }

        [Display(Name = "Tên sinh viên trưởng nhóm")]
        [Required(ErrorMessage = "Yêu cầu nhập tên sinh viên 1")]
        public string tenSv1 { set; get; }

        [Display(Name = "Mã nhóm")]
        [Required(ErrorMessage = "Yêu cầu nhập mã nhóm")]
        public long maNhom { set; get; }
    }
}