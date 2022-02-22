var express = require("express");
var router = express.Router();
var noticiasModel = require("../../models/noticiasModel");
var util = require("util");
var cloudinary = require("cloudinary").v2;
const uploader = util.promisify(cloudinary.uploader.upload);
const destroy = util.promisify(cloudinary.uploader.destroy);

router.get("/", async function (req, res, next) {
  var noticias = await noticiasModel.getNoticias();

  noticias = noticias.map((noticias) => {
    if (noticias.img_id) {
      const imagen = cloudinary.image(noticias.img_id, {
        width: 50,
        height: 50,
        crop: "pad",
      });
      return {
        ...noticias,
        imagen,
      };
    } else {
      return {
        ...noticias,
        imagen: "",
      };
    }
  });

  res.render("admin/noticias", {
    layout: "admin/layout",
    usuario: req.session.nombre,
    noticias,
  });
});

router.get("/agregar", (req, res, next) => {
  res.render("admin/agregar", {
    layout: "admin/layout",
  });
});

router.post("/agregar", async (req, res, next) => {
  console.log(req.body);
  try {
    var img_id = "";
    if (req.files && Object.keys(req.files).length > 0) {
      imagen = req.files.imagen;
      img_id = (await uploader(imagen.tempFilePath)).public_id;
    }

    if (req.body.titulo != "" && req.body.cuerpo != "") {
      await noticiasModel.insertNoticia({
        ...req.body,
        img_id,
      });
      res.redirect("/admin/noticias");
    } else {
      res.render("admin/agregar", {
        layout: "admin/layout",
        error: true,
        message: "Todos los campos son requeridos",
      });
    }
  } catch (error) {
    console.log(error);
    res.render("admin/agregar", {
      layout: "admin/layout",
      error: true,
      message: "No se cargo la novedad",
    });
  }
});

// ELIMINAR UNA NOTICIA

router.get("/eliminar/:id", async (req, res, next) => {
  var id = req.params.id;

  let noticia = await noticiasModel.getNoticiasById(id);
  if (noticia.img_id) {
    await destroy(noticia.img_id);
  }

  await noticiasModel.deleteNoticiasById(id);
  res.redirect("/admin/noticias");
});

// Modificar + traer los datos de una sola noticia

router.get("/modificar/:id", async (req, res, next) => {
  let id = req.params.id;
  let noticia = await noticiasModel.getNoticiasById(id);

  res.render("admin/modificar", {
    layout: "admin/layout",
    noticia,
  });
});

router.post("/modificar", async (req, res, next) => {
  try {
    let img_id = req.body.img_original;
    let borrar_img_vieja = false;
    if (req.body.img_delete === "1") {
      img_id = null;
      borrar_img_vieja = true;
    } else {
      if (req.files && Object.keys(req.files).length > 0) {
        imagen = req.files.imagen;
        img_id = (await uploader(imagen.tempFilePath)).public_id;
        borrar_img_vieja = true;
      }
    }
    if (borrar_img_vieja && req.body.img_original) {
      await destroy(req.body.img_original);
    }

    let obj = {
      titulo: req.body.titulo,
      cuerpo: req.body.cuerpo,
      img_id,
    };

    console.log(obj);
    await noticiasModel.modificarNoticiasById(obj, req.body.id);
    res.redirect("/admin/noticias");
  } catch (error) {
    console.log(error);
    res.render("/admin/modificar", {
      layout: "admin/layout",
      error: true,
      message: "No se modifico la novedad",
    });
  }
});

module.exports = router;
