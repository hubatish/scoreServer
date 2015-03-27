namespace ScoreServiceRole.Models
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class ScoreServiceEntity : DbContext
    {
        public ScoreServiceEntity()
            : base("name=ScoreServiceEntity")
        {
        }

        public virtual DbSet<EasyScore> EasyScores { get; set; }
        public virtual DbSet<UserScore> UserScores { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<EasyScore>()
                .HasOptional(e => e.UserScore)
                .WithRequired(e => e.EasyScore);
        }
    }
}
