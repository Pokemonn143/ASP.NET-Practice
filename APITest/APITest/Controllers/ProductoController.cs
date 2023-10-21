using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using APITest.Models;

namespace APITest.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductoController : ControllerBase
    {
        public readonly DbapiContext _dbapiContext;

        public ProductoController(DbapiContext _Context)
        {
            _dbapiContext = _Context;
        }

        [HttpGet]
        [Route("Lista")]
        public IActionResult Lista() { 
        
            List<Producto> Lista = new List<Producto>();

            try
            {
                Lista=_dbapiContext.Productos.ToList();

                return StatusCode(StatusCodes.Status200OK, new { mensaje = "ok", Response = Lista });

            }catch (Exception ex)
            {

                return StatusCode(StatusCodes.Status200OK, new { mensaje = ex.Message, Response = Lista });

            }
        
        }

    }
}
