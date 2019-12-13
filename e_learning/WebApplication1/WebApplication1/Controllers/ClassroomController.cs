using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebApplication1.Models;

namespace WebApplication1.Controllers
{
    public class ClassroomController : Controller
    {
        QldaDataContext data = new QldaDataContext();
        // GET: Classroom
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Montheosv()
        {

            var sinhvien = from sv in data.BaoCaos select sv;
            return View(sinhvien);
        }
        [HttpGet]
        public ActionResult Nopbai(string id)
        {
            var nopbai = from np in data.BaoCaos where np.MaMon == id select np;
            return View(nopbai.Single());
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Nopbai(BaoCao bc ,HttpPostedFileBase file)
        {

            try
            {
                if (file == null)
                {
                    ViewBag.Thongbao = "Vui lòng chọn file";
                    return View();
                }
                else
                {
                    if (ModelState.IsValid)
                    {
                        var fileName = Path.GetFileName(file.FileName);
                        var path = Path.Combine(Server.MapPath("~/Uploadfile"), fileName);
                        if (System.IO.File.Exists(path))
                            file.SaveAs(path);
                        bc.filedemo = fileName;
                        data.BaoCaos.InsertOnSubmit(bc);
                        data.SubmitChanges();
                    }
                    ViewBag.Message = "Nộp bài thành công !!";
                    return RedirectToAction("Nopbai");
                }
            }
            catch
            {
                ViewBag.Message = "Nộp thất bại!!";
                return View("Nopbai");
            }
        }

    }
}