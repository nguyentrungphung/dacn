using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebApplication1.Models;

namespace WebApplication1.Controllers
{
    public class HomeController : Controller
    {
        QldaDataContext data = new QldaDataContext();
        private List<KhoaHoc> Laykhmoi(int count)
        {
            return data.KhoaHocs.OrderByDescending(a => a.Ngaydang).Take(count).ToList();
        }
        public ActionResult Index()
        {
          
            var spmoi = Laykhmoi(5);
            return View(spmoi);
        }
        public ActionResult Loai()
        {
            var loai = from l in data.Loais select l;
            return PartialView(loai);
        }
        public ActionResult SPtheoLoai(string id)
        {
            var khoahoc = from kh in data.KhoaHocs where kh.MaLoai == id select kh;
            return View(khoahoc);
        }
        [HttpGet]
        public ActionResult Details(string id)
        {
            var khoahoc = from kh in data.KhoaHocs where kh.Makhoahoc == id select kh;
            return View(khoahoc.Single());
        }

    }
}