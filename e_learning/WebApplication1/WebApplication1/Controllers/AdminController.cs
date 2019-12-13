using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebApplication1.Models;

namespace WebApplication1.Controllers
{
    public class AdminController : Controller
    {
        QldaDataContext data = new QldaDataContext();
        // GET: Admin
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Khoa()
        {
            return View(data.Khoas.ToList());
        }
        [HttpGet]
        public ActionResult ThemmoiKhoa()
        {
            return View();
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult ThemmoiKhoa(Khoa k)
        {
            data.Khoas.InsertOnSubmit(k);
            data.SubmitChanges();
            return RedirectToAction("Khoa");
        }
        public ActionResult ChitietKhoa(String id)
        {
            Khoa k = data.Khoas.SingleOrDefault(n => n.MaKhoa == id);
            ViewBag.MaKhoa = k.MaKhoa;
            if (k == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(k);
        }
       
        [HttpGet]
        public ActionResult SuaKhoa(String id)
        {
            Khoa k = data.Khoas.SingleOrDefault(n => n.MaKhoa == id);

            if (k == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(k);
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult SuaKhoa(Khoa k)
        {
            UpdateModel(k);
            data.SubmitChanges();
            return RedirectToAction("Khoa");
        }

        public ActionResult Lop()
        {
            return View(data.Lops.ToList());
        }
        [HttpGet]
        public ActionResult ThemmoiLop()
        {
            return View();
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult ThemmoiLop(Lop l)
        {
            data.Lops.InsertOnSubmit(l);
            data.SubmitChanges();
            return RedirectToAction("Lop");
        }
        public ActionResult ChitietLop(String id)
        {
            Lop l = data.Lops.SingleOrDefault(n => n.MaLop == id);
            ViewBag.MaLop = l.MaLop;
            if (l == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(l);
        }

        [HttpGet]
        public ActionResult SuaLop(String id)
        {
            Lop l = data.Lops.SingleOrDefault(n => n.MaLop == id);

            if (l == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(l);
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult SuaLop(Lop l)
        {
            UpdateModel(l);
            data.SubmitChanges();
            return RedirectToAction("Lop");
        }

        public ActionResult Giangvien()
        {
            return View(data.Giangviens.ToList());
        }
        [HttpGet]
        public ActionResult ThemmoiGv()
        {
            return View();
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult ThemmoiGv(Giangvien gv)
        {
            data.Giangviens.InsertOnSubmit(gv);
            data.SubmitChanges();
            return RedirectToAction("Giangvien");
        }
        public ActionResult ChitietGv(String id)
        {
            Giangvien gv = data.Giangviens.SingleOrDefault(n => n.Magv == id);
            ViewBag.Magv = gv.Magv;
            if (gv == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(gv);
        }

        [HttpGet]
        public ActionResult SuaGv(String id)
        {
            Giangvien gv = data.Giangviens.SingleOrDefault(n => n.Magv == id);

            if (gv == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(gv);
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult SuaGv(Giangvien gv)
        {
            UpdateModel(gv);
            data.SubmitChanges();
            return RedirectToAction("Giangvien");
        }


        public ActionResult Sinhvien()
        {
            return View(data.SinhViens.ToList());
        }
        [HttpGet]
        public ActionResult ThemmoiSv()
        {
            return View();
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult ThemmoiSv(SinhVien sv)
        {
            data.SinhViens.InsertOnSubmit(sv);
            data.SubmitChanges();
            return RedirectToAction("Sinhvien");
        }
        public ActionResult ChitietSv(String id)
        {
            SinhVien sv = data.SinhViens.SingleOrDefault(n => n.Masv == id);
            ViewBag.Masv = sv.Masv;
            if (sv == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(sv);
        }

        [HttpGet]
        public ActionResult SuaSv(String id)
        {
            SinhVien sv = data.SinhViens.SingleOrDefault(n => n.Masv == id);

            if (sv == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(sv);
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult SuaSv(SinhVien sv)
        {
            UpdateModel(sv);
            data.SubmitChanges();
            return RedirectToAction("Sinhvien");
        }
    }
}