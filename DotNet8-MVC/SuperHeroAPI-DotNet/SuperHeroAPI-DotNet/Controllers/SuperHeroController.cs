using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using SuperHeroAPI_DotNet.Data;
using SuperHeroAPI_DotNet.Entities;

namespace SuperHeroAPI_DotNet.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SuperHeroController : ControllerBase
    {
        private readonly DataContex _context;

        public SuperHeroController(DataContex context)
        {
            _context = context;
        }

        [HttpGet]
        public async Task<ActionResult<List<SuperHero>>> GetAllHeroes()
        {
            var heroes = await _context.SuperHeroes.ToListAsync();


            return Ok(heroes);
        }

        [HttpGet("{id}")]
       
        public async Task<ActionResult<List<SuperHero>>> GetHero(int id)
        {
            var heroes = await _context.SuperHeroes.ToListAsync();
            if(heroes is null)
            {
                return NotFound();
            }

            return Ok(heroes);
        }

    }
}
