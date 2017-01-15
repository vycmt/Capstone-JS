using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(BMW.Startup))]
namespace BMW
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
