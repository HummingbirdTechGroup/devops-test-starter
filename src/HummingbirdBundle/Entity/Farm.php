<?php

namespace HummingbirdBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity
 * @ORM\Table(name="farms")
 */
class Farm
{
    /**
     * @ORM\Column(type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;

    /**
     * @ORM\Column(type="string")
     */
    private $name;

    /**
     * @ORM\Column(type="decimal", scale=2)
     */
    private $hectarage;

    /**
     * @ORM\Column(type="string")
     */
    private $region;

    /**
     * @return mixed
     */
    public function getName()
    {
        return $this->name;
    }

    /**
     * @return mixed
     */
    public function getHectarage()
    {
        return $this->hectarage;
    }

    /**
     * @return mixed
     */
    public function getRegion()
    {
        return $this->region;
    }
}
