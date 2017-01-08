using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(JSAdminWebsite.Startup))]
namespace JSAdminWebsite
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
