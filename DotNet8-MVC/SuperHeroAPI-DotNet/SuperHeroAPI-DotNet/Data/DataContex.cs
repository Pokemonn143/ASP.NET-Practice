using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using SuperHeroAPI_DotNet.Entities;

namespace SuperHeroAPI_DotNet.Data
{
    public class DataContex: IdentityDbContext //Usanto el <> se puede cambiar el usuario que se usa en vez del Identity User.
    {

        public DataContex(DbContextOptions<DataContex> options) :base(options)
        {
            
        }

        public DbSet<SuperHero> SuperHeroes { get; set; }

    }
}
