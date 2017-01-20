using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using BMWAdmin.Models;

namespace BMWAdmin.Controllers
{
    public class SysCategoriesController : Controller
    {
        private BMWEntities db = new BMWEntities();

        // GET: SysCategories
        public ActionResult Index()
        {
            var sysCategories = db.SysCategories.Include(s => s.SysCategory1);
            return View(sysCategories.ToList());
        }

        // GET: SysCategories/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SysCategory sysCategory = db.SysCategories.Find(id);
            if (sysCategory == null)
            {
                return HttpNotFound();
            }
            return View(sysCategory);
        }

        // GET: SysCategories/Create
        public ActionResult Create()
        {
            ViewBag.ParentId = new SelectList(db.SysCategories, "Id", "Name");
            return View();
        }

        // POST: SysCategories/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,ParentId,Name,Image,SortOrder,Flag")] SysCategory sysCategory)
        {
            if (ModelState.IsValid)
            {
                db.SysCategories.Add(sysCategory);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.ParentId = new SelectList(db.SysCategories, "Id", "Name", sysCategory.ParentId);
            return View(sysCategory);
        }

        // GET: SysCategories/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SysCategory sysCategory = db.SysCategories.Find(id);
            if (sysCategory == null)
            {
                return HttpNotFound();
            }
            ViewBag.ParentId = new SelectList(db.SysCategories, "Id", "Name", sysCategory.ParentId);
            return View(sysCategory);
        }

        // POST: SysCategories/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,ParentId,Name,Image,SortOrder,Flag")] SysCategory sysCategory)
        {
            if (ModelState.IsValid)
            {
                db.Entry(sysCategory).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ParentId = new SelectList(db.SysCategories, "Id", "Name", sysCategory.ParentId);
            return View(sysCategory);
        }

        // GET: SysCategories/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SysCategory sysCategory = db.SysCategories.Find(id);
            if (sysCategory == null)
            {
                return HttpNotFound();
            }
            return View(sysCategory);
        }

        // POST: SysCategories/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            SysCategory sysCategory = db.SysCategories.Find(id);
            db.SysCategories.Remove(sysCategory);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
