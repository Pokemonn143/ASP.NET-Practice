namespace SuperHeroAPI_DotNet.Entities
{
    public class SuperHero
    {
        public int ID { get; set; }
        public required string Name { get; set; }

        public string FirstName { get; set; } = string.Empty;

        public string LastName { get; set; } = string.Empty;

        public string place { get; set; } = string.Empty;
    }
}
