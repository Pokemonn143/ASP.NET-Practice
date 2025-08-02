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
       
        public async Task<ActionResult<SuperHero>> GetHero(int id)
        {
            var hero = await _context.SuperHeroes.FindAsync(id);
            if(hero is null)
            {
                return NotFound();
            }

            return Ok(hero);
        }

        [HttpPost]

        public async Task<ActionResult<List<SuperHero>>> AddHero(SuperHero hero)
        {
            _context.SuperHeroes.Add(hero);
            await _context.SaveChangesAsync();

            return Ok(await _context.SuperHeroes.ToListAsync());
        }

        [HttpPut]

        public async Task<ActionResult<List<SuperHero>>> UpdateHero(SuperHero Updatehero)
        {
            var dbhero = await _context.SuperHeroes.FindAsync(Updatehero.ID);
            if (dbhero is null)
            
                return NotFound();

            dbhero.Name = Updatehero.Name;
            dbhero.FirstName = Updatehero.FirstName;
            dbhero.LastName = Updatehero.LastName;
            dbhero.place = Updatehero.place;

            await _context.SaveChangesAsync();

            return Ok(await _context.SuperHeroes.ToListAsync());

            
                
        }
    }
}
