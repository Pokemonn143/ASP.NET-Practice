using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using SuperHeroAPI_DotNet.Entities;

namespace SuperHeroAPI_DotNet.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SuperHeroController : ControllerBase
    {
        [HttpGet]
        public async Task<ActionResult<List<SuperHero>>> GetAllHeroes()
        {
            var heroes = new List<SuperHero>
            {
                new SuperHero
                {
                    ID = 1,
                    Name = "Superman",
                    FirstName="Klark",
                    LastName="Tent",
                    place="USA"
                }
            };

            return Ok(heroes);
        }

    }
}
