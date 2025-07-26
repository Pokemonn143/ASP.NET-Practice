using Microsoft.EntityFrameworkCore;
using SuperHeroAPI_DotNet.Entities;

namespace SuperHeroAPI_DotNet.Data
{
    public class DataContex: DbContext
    {

        public DataContex(DbContextOptions<DataContex> options) :base(options)
        {
            
        }

        public DbSet<SuperHero> SuperHeroes { get; set; }

    }
}
